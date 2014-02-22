//
//  ViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2s13 Jeremy Herrero. All rights reserved.
//

#import "GamePlayViewController.h"
#import "Tiles.h"
#import "ComputerMovesFirst.h"
#import "PlayerMovesFirst.h"
#import "TwoPlayerMoves.h"
#import <Parse/Parse.h>

// I learned to create outlets here rather than in the header file because it keeps them private
@interface GamePlayViewController () {
    
    ComputerMovesFirst              *computerMovesFirst;
    PlayerMovesFirst                *playerMovesFirst;
    TwoPlayerMoves                  *twoPlayerMoves;
    NSTimer                         *timer;
    UIColor                         *xBackground;
    __weak IBOutlet UILabel         *resultLabel;
    __weak IBOutlet UILabel         *winsLabel;
    __weak IBOutlet UILabel         *lossesLabel;
    __weak IBOutlet UIView          *gameResultsView;
    __weak IBOutlet UIImageView     *boardImageView;
    __weak IBOutlet UIButton        *mainMenuButton;
    __weak IBOutlet UIButton        *resetButton;
    __weak IBOutlet ADBannerView    *adBannerView;
}

- (IBAction)restartGame:(id)sender;
- (IBAction)tryAgain:(id)sender;
- (IBAction)mainMenu:(id)sender;
- (IBAction)changeDifficulty:(id)sender;

@end

@implementation GamePlayViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Aqua.png"]];
    boardImageView.image = [UIImage imageNamed:@"board.png"];
    if ([UIScreen mainScreen].bounds.size.height > 480) {
        mainMenuButton.transform = CGAffineTransformTranslate(mainMenuButton.transform, 0, 100);
        resetButton.transform = CGAffineTransformTranslate(resetButton.transform, 0, 100);
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    //    [gameResultsView setAlpha:0.85];
    //    gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
    [gameResultsView setAlpha:0];
    [gameResultsView setHidden:YES];
    
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
        tile.backgroundColor = [UIColor clearColor];
    }
    for(Tiles *tileViews in self.view.subviews) {
        if([tileViews isKindOfClass:[UIView class]]) {
            [tileViews setExclusiveTouch:YES];
        }
    }
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[Tiles class]]) {
            Tiles *tiles = (Tiles *)subview;
            tiles.delegate = self;
        }
    }
    gameResultsView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Aqua.png"]];
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
        winsLabel.text = @"Won: 0";
        lossesLabel.text = @"Lost: 0";
        
        [[NSUserDefaults standardUserDefaults] setBool:1 forKey:@"singlePlayerGame"];
        
        computerMovesFirst = [[ComputerMovesFirst alloc] init];
        playerMovesFirst = [[PlayerMovesFirst alloc] init];
        [computerMovesFirst initMutableArrays];
        [playerMovesFirst initMutableArrays];
        
        computerMovesFirst.delegate = self;
        playerMovesFirst.delegate = self;
        
        _computerIsFirst = YES;
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
            if (![[NSUserDefaults standardUserDefaults] boolForKey:@"playingPiece"]) {
                xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o_tile.png"]];
            } else {
                xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x_tile.png"]];
            }
        } else {
            xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x_tile.png"]];
        }
        
        [self performSelector:@selector(initialSinglePlayerGame) withObject:self afterDelay:0.3];
    } else {
        winsLabel.text = @"Player 1: 0";
        lossesLabel.text = @"Player 2: 0";
        
        twoPlayerMoves = [[TwoPlayerMoves alloc] init];
        [twoPlayerMoves initMutableArrays];
        
        twoPlayerMoves.delegate = self;
        
        [[NSUserDefaults standardUserDefaults] setBool:0 forKey:@"singlePlayerGame"];
        _moveCount = 0;
        xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x_tile.png"]];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    PFObject *object = [PFObject objectWithClassName:@"Results"];
    if (_normalDifficulty) {
        object[@"NormalWins"] = winsLabel.text;
        object[@"NormalLosses"] = lossesLabel.text;
    } else if (_impossibleDifficulty) {
        object[@"ImpossibleWins"] = winsLabel.text;
        object[@"ImpossibleLosses"] = lossesLabel.text;
    } else if (![[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
        object[@"P1Wins"] = winsLabel.text;
        object[@"P2Wins"] = lossesLabel.text;
    } else {
        object[@"EasyWins"] = winsLabel.text;
        object[@"EasyLosses"] = lossesLabel.text;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    object[@"UserID"] = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"userID"]];
    [object saveInBackground];
}

- (void)applicationDidEnterBackground:(NSNotificationCenter *)notification {
    PFObject *object = [PFObject objectWithClassName:@"Results"];
    if (_normalDifficulty) {
        object[@"NormalWins"] = winsLabel.text;
        object[@"NormalLosses"] = lossesLabel.text;
    } else if (_impossibleDifficulty) {
        object[@"ImpossibleWins"] = winsLabel.text;
        object[@"ImpossibleLosses"] = lossesLabel.text;
    } else if (![[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
        object[@"P1Wins"] = winsLabel.text;
        object[@"P2Wins"] = lossesLabel.text;
    } else {
        object[@"EasyWins"] = winsLabel.text;
        object[@"EasyLosses"] = lossesLabel.text;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    object[@"UserID"] = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"userID"]];
    [object saveInBackground];
}

- (void)initialSinglePlayerGame {
    computerMovesFirst.compHasCornersNoHumanCenter = NO;
    computerMovesFirst.compHasCornersHumanHasCenter = NO;
    computerMovesFirst.compDoesNotHaveBothGoldenCorners = NO;
    computerMovesFirst.compHasAllThreeCorners = NO;
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
    }
    if (_normalDifficulty) {
        int randomizer = arc4random() % 2;
        switch (randomizer) {
            case 0:
                [computerMovesFirst firstMove:YES];
                _impossibleDifficulty = YES;
                break;
            default:
                [computerMovesFirst firstMove:NO];
                _impossibleDifficulty = NO;
                break;
        }
    } else if (_impossibleDifficulty) {
        [computerMovesFirst firstMove:YES];
    } else
        [computerMovesFirst firstMove:NO];
}

- (void)resetSinglePlayerGame {
    _gameEnded = NO;
    computerMovesFirst.compHasCornersNoHumanCenter = NO;
    computerMovesFirst.compHasCornersHumanHasCenter = NO;
    computerMovesFirst.compDoesNotHaveBothGoldenCorners = NO;
    computerMovesFirst.compHasAllThreeCorners = NO;
    [computerMovesFirst.playerMoves removeAllObjects];
    [computerMovesFirst.computerMoves removeAllObjects];
    [playerMovesFirst.playerMoves removeAllObjects];
    [playerMovesFirst.computerMoves removeAllObjects];
    [self resetStandardSettings];
    
    if (_roundsCounter % 2 == 0) {
        _computerIsFirst = YES;
        if (_impossibleDifficulty) {
            [computerMovesFirst firstMove:YES];
        } else {
            [computerMovesFirst firstMove:NO];
        }
    } else {
        _computerIsFirst = NO;
    }
}

- (void)resetTwoPlayerGame {
    [twoPlayerMoves.playerOneMoves removeAllObjects];
    [twoPlayerMoves.playerTwoMoves removeAllObjects];
    [self resetStandardSettings];
}

- (void)resetStandardSettings {
    _moveCount = 0;
    _roundsCounter++;
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
        tile.backgroundColor = [UIColor clearColor];
    }
    gameResultsView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Aqua.png"]];
}

#pragma mark TilesDelegate
- (void)tileUserInteraction:(BOOL)enable {
    self.view.userInteractionEnabled = enable;
}

- (void)computerMakesMove:(int)tagNumber {
    [self tileUserInteraction:NO];
    for (UIView *tileMove in self.view.subviews) {
        if (tileMove.tag == tagNumber) {
            tileMove.backgroundColor = xBackground;
            [tileMove setUserInteractionEnabled:NO];
            tileMove.transform = CGAffineTransformScale(tileMove.transform, 0.01, 0.01);
            if (_computerIsFirst) {
                [computerMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            } else {
                [playerMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            }
            [UIView animateWithDuration:0.7 animations:^{
                tileMove.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [self tileUserInteraction:YES];
            }];
            break;
        }
    }
}

- (void)singlePlayerTileSelected:(Tiles *)tiles {
    _moveCount++;
    if (_computerIsFirst) {
        [computerMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        [computerMovesFirst winCheck];
        if (!_gameEnded) {
            switch (_moveCount) {
                case 1:
                    if (_impossibleDifficulty) {
                        [computerMovesFirst secondMove:YES];
                    } else {
                        [computerMovesFirst secondMove:NO];
                    }
                    break;
                case 2:
                    if (_impossibleDifficulty) {
                        [computerMovesFirst thirdMove:YES];
                    } else {
                        [computerMovesFirst thirdMove:NO];
                    }
                    break;
                case 3:
                    if (_impossibleDifficulty) {
                        [computerMovesFirst fourthMove:YES];
                    } else {
                        [computerMovesFirst fourthMove:NO];
                    }
                    break;
                case 4:
                    if (_impossibleDifficulty) {
                        [computerMovesFirst fifthMove:YES];
                    } else {
                        [computerMovesFirst fifthMove:NO];
                    }
                    break;
                default:NSLog(@"error in move count");
                    break;
            }
        }
    } else {
        if (_normalDifficulty && _moveCount == 1) {
            int randomizer = arc4random() % 2;
            switch (randomizer) {
                case 0:
                    _impossibleDifficulty = YES;
                    break;
                default:
                    _impossibleDifficulty = NO;
                    break;
            }
        }
        [playerMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        [playerMovesFirst winCheck];
        if (!_gameEnded) {
            switch (_moveCount) {
                case 1:
                    if (_impossibleDifficulty) {
                        [playerMovesFirst firstMove:YES];
                    } else {
                        [playerMovesFirst firstMove:NO];
                    }
                    break;
                case 2:
                    if (_impossibleDifficulty) {
                        [playerMovesFirst secondMove:YES];
                    } else {
                        [playerMovesFirst secondMove:NO];
                    }
                    break;
                case 3:
                    if (_impossibleDifficulty) {
                        [playerMovesFirst thirdMove:YES];
                    } else {
                        [playerMovesFirst thirdMove:NO];
                    }
                    break;
                case 4:
                    if (_impossibleDifficulty) {
                        [playerMovesFirst fourthMove:YES];
                    } else {
                        [playerMovesFirst fourthMove:NO];
                    }
                    break;
                case 5:
                    [playerMovesFirst fifthMove];
                    break;
                default:NSLog(@"error in move count");
                    break;
            }
        }
    }
}

- (void)twoPlayerTileSelected:(Tiles *)tiles {
    UIImage *xTile;
    UIImage *oTile;
    if (_roundsCounter % 2 == 0) {
        xTile = [UIImage imageNamed:@"x_tile.png"];
        oTile = [UIImage imageNamed:@"o_tile.png"];
    } else {
        xTile = [UIImage imageNamed:@"o_tile.png"];
        oTile = [UIImage imageNamed:@"x_tile.png"];
    }
    _moveCount++;
    if (_moveCount % 2 != 0) {
        [twoPlayerMoves.playerOneMoves addObject:[NSNumber numberWithInt:tiles.tag]];
        tiles.transform = CGAffineTransformScale(tiles.transform, 0.01, 0.01);
        tiles.backgroundColor = [UIColor colorWithPatternImage:xTile];
        [tiles setUserInteractionEnabled:NO];
        [UIView animateWithDuration:0.7 animations:^{
            tiles.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self tileUserInteraction:YES];
        }];
    } else {
        [twoPlayerMoves.playerTwoMoves addObject:[NSNumber numberWithInt:tiles.tag]];
        tiles.transform = CGAffineTransformScale(tiles.transform, 0.01, 0.01);
        tiles.backgroundColor = [UIColor colorWithPatternImage:oTile];
        [tiles setUserInteractionEnabled:NO];
        [UIView animateWithDuration:0.7 animations:^{
            tiles.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self tileUserInteraction:YES];
        }];
    }
    if (_moveCount >= 5 && _moveCount < 9) {
        [twoPlayerMoves winCheck:NO];
    } else if (_moveCount == 9) {
        [twoPlayerMoves winCheck:YES];
    }
}

- (void)playerOneWon:(BOOL)isPlayerOne {
    if (_roundsCounter % 2 == 0) {
        if (isPlayerOne) {
            resultLabel.text = @"Player 1 Won!";
            [gameResultsView setHidden:NO];
            [UIView animateWithDuration:0.3 animations:^{
                //                gameResultsView.transform = CGAffineTransformIdentity;
                [gameResultsView setAlpha:0.85];
            } completion:^(BOOL finished) {
            }];
            _winCount++;
            winsLabel.text = [NSString stringWithFormat: @"Player 1: %i", _winCount];
        } else {
            resultLabel.text = @"Player 2 Won!";
            [gameResultsView setHidden:NO];
            [UIView animateWithDuration:0.3 animations:^{
                //                gameResultsView.transform = CGAffineTransformIdentity;
                [gameResultsView setAlpha:0.85];
            } completion:nil];
            _loseCount++;
            lossesLabel.text = [NSString stringWithFormat: @"Player 2: %i", _loseCount];
        }
    } else {
        if (!isPlayerOne) {
            resultLabel.text = @"Player 1 Won!";
            [gameResultsView setHidden:NO];
            [UIView animateWithDuration:0.3 animations:^{
                //                gameResultsView.transform = CGAffineTransformIdentity;
                [gameResultsView setAlpha:0.85];
            } completion:^(BOOL finished) {
            }];
            _winCount++;
            winsLabel.text = [NSString stringWithFormat: @"Player 1: %i", _winCount];
        } else {
            resultLabel.text = @"Player 2 Won!";
            [gameResultsView setHidden:NO];
            [UIView animateWithDuration:0.3 animations:^{
                //                gameResultsView.transform = CGAffineTransformIdentity;
                [gameResultsView setAlpha:0.85];
            } completion:nil];
            _loseCount++;
            lossesLabel.text = [NSString stringWithFormat: @"Player 2: %i", _loseCount];
        }
        
    }
}

- (void)playerWon {
    _gameEnded = YES;
    resultLabel.text = @"You Win!!";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        //        gameResultsView.transform = CGAffineTransformIdentity;
        [gameResultsView setAlpha:0.85];
    } completion:^(BOOL finished) {
    }];
    _winCount++;
    winsLabel.text = [NSString stringWithFormat: @"Won: %i", _winCount];
}

- (void)playerLost {
    _gameEnded = YES;
    [self performSelector:@selector(setPlayerLost) withObject:self afterDelay:0.7];
}

- (void)setPlayerLost {
    resultLabel.text = @"You Lose :(";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
        //        gameResultsView.transform = CGAffineTransformIdentity;
        [gameResultsView setAlpha:0.85];
    } completion:nil];
    _loseCount++;
    lossesLabel.text = [NSString stringWithFormat: @"Lost: %i", _loseCount];
}

- (void)catsTie {
    _gameEnded = YES;
    resultLabel.text = @"Cat's Tie";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        //        gameResultsView.transform = CGAffineTransformIdentity;
        [gameResultsView setAlpha:0.85];
    } completion:nil];
}

#pragma mark iAd BannerView Delegate
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView animateWithDuration:0.5 animations:^{
        [banner setAlpha:1];
    }];
    //    [UIView beginAnimations:nil context:NULL];
    //    [UIView setAnimationDuration:0.01];
    //    [banner setAlpha:1];
    //    [UIView commitAnimations];
    //    CGRect adFrame = iAdBannerView.frame;
    //    adFrame.origin.y = self.view.frame.size.height;
    //    iAdBannerView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    return YES;
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    PFObject *object = [PFObject objectWithClassName:@"iAdReport"];
    object[@"FailureReport"] = [NSString stringWithFormat:@"%@", error];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    object[@"UserID"] = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"userID"]];
    [object saveInBackground];
    [UIView animateWithDuration:0.5 animations:^{
        [banner setAlpha:0];
    }];
    //    [UIView beginAnimations:nil context:NULL];
    //    [UIView setAnimationDuration:1];
    //    [banner setAlpha:0];
    //    [iAdBannerView setAlpha:0];
    //    [UIView commitAnimations];
    
    //    NSLog(@"iAd Failed: %@", error);
}

- (IBAction)restartGame:(id)sender {
    _loseCount++;
    lossesLabel.text = [NSString stringWithFormat: @"Player 2: %i", _loseCount];
    [self resetSinglePlayerGame];
}

- (IBAction)tryAgain:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [gameResultsView setAlpha:0];
        //        [gameResultsView layoutIfNeeded];
        //        gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
    } completion:^(BOOL finished) {
        [gameResultsView setHidden:YES];
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
            [self resetSinglePlayerGame];
        } else {
            [self resetTwoPlayerGame];
        }
    }];
}

- (IBAction)mainMenu:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}

- (IBAction)changeDifficulty:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end