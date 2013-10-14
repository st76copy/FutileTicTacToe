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

// I learned to create outlets here rather than in the header file because it keeps them private
@interface GamePlayViewController () {
    
    ComputerMovesFirst              *computerMovesFirst;
    PlayerMovesFirst                *playerMovesFirst;
    NSTimer                         *timer;
    UIColor                         *xBackground;
    __weak IBOutlet UILabel         *resultLabel;
    __weak IBOutlet UILabel         *winsLabel;
    __weak IBOutlet UILabel         *lossesLabel;
    __weak IBOutlet UIImageView     *boardImageView;
    __weak IBOutlet UIView          *gameResultsView;
    __weak IBOutlet UIButton        *startGameButton;
}

- (IBAction)startGame:(id)sender;
- (IBAction)tryAgain:(id)sender;
- (IBAction)changeDifficulty:(id)sender;

@end

@implementation GamePlayViewController

@synthesize normalDifficulty, gameEnded, computerIsFirst, moveCount, winCount, loseCount, count, roundsCounter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    count = 0;
    computerMovesFirst = [[ComputerMovesFirst alloc] init];
    playerMovesFirst = [[PlayerMovesFirst alloc] init];
    [computerMovesFirst initMutableArrays];
    [playerMovesFirst initMutableArrays];
    
    boardImageView.image = [UIImage imageNamed:@"board.png"];
    xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
    [gameResultsView setHidden:YES];
    
    computerIsFirst = YES;
    
    computerMovesFirst.delegate = self;
    playerMovesFirst.delegate = self;
    
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
    [self performSelector:@selector(initialGame) withObject:self afterDelay:0.3];
}

- (void)setNormalDifficulty {
    normalDifficulty = YES;
}

- (void)initialGame {
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
    }
    [startGameButton setTitle:@"Reset Game" forState:UIControlStateNormal];
    computerMovesFirst.compHasCornersNoHumanCenter = NO;
    computerMovesFirst.compHasCornersHumanHasCenter = NO;
    computerMovesFirst.compDoesNotHaveBothGoldenCorners = NO;
    computerMovesFirst.compHasAllThreeCorners = NO;
    if (normalDifficulty) {
        [computerMovesFirst firstMove:YES];
    } else
        [computerMovesFirst firstMove:NO];
}

- (void)resetGame {
    gameEnded = NO;
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
        tile.backgroundColor = [UIColor whiteColor];
    }
    [computerMovesFirst.playerMoves removeAllObjects];
    [computerMovesFirst.computerMoves removeAllObjects];
    [playerMovesFirst.playerMoves removeAllObjects];
    [playerMovesFirst.computerMoves removeAllObjects];
    moveCount = 0;
    computerMovesFirst.compHasCornersNoHumanCenter = NO;
    computerMovesFirst.compHasCornersHumanHasCenter = NO;
    computerMovesFirst.compDoesNotHaveBothGoldenCorners = NO;
    computerMovesFirst.compHasAllThreeCorners = NO;
    roundsCounter++;
    if (roundsCounter % 2 == 0) {
        computerIsFirst = YES;
        if (normalDifficulty) {
            [computerMovesFirst firstMove:YES];
        }
    } else {
        computerIsFirst = NO;
    }
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
            if (computerIsFirst) {
                [computerMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            } else {
                [playerMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            }
            [UIView animateWithDuration:0.7 animations:^{
                tileMove.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [self tileUserInteraction:YES];
            }];
        }
    }
}

- (void)tileSelected:(Tiles *)tiles {
    moveCount++;
    NSLog(@"gameEnded: %d", gameEnded);
    if (computerIsFirst) {
        [computerMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        [computerMovesFirst winCheck];
        if (!gameEnded) {
            NSLog(@"computerMoves: %@" , computerMovesFirst.computerMoves);
            NSLog(@"playerMoves: %@" , computerMovesFirst.playerMoves);
            switch (moveCount) {
                case 1:
                    if (normalDifficulty) {
                        [computerMovesFirst secondMove:YES];
                    } else {
                        [computerMovesFirst secondMove:NO];
                    }
                    break;
                case 2:
                    if (normalDifficulty) {
                        [computerMovesFirst thirdMove:YES];
                    } else {
                        [computerMovesFirst thirdMove:NO];
                    }
                    break;
                case 3:
                    if (normalDifficulty) {
                        [computerMovesFirst fourthMove:YES];
                    } else {
                        [computerMovesFirst fourthMove:NO];
                    }
                    break;
                case 4:
                    if (normalDifficulty) {
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
        [playerMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        [playerMovesFirst winCheck];
        if (!gameEnded) {
            NSLog(@"computerMoves: %@" , playerMovesFirst.computerMoves);
            NSLog(@"playerMoves: %@" , playerMovesFirst.playerMoves);
            switch (moveCount) {
                case 1:
                    if (normalDifficulty) {
                        [playerMovesFirst firstMove:YES];
                    } else {
                        [playerMovesFirst firstMove:NO];
                    }
                    break;
                case 2:
                    if (normalDifficulty) {
                        [playerMovesFirst secondMove:YES];
                    } else {
                        [playerMovesFirst secondMove:NO];
                    }
                    break;
                case 3:
                    if (normalDifficulty) {
                        [playerMovesFirst thirdMove:YES];
                    } else {
                        [playerMovesFirst thirdMove:NO];
                    }
                    break;
                case 4:
                    if (normalDifficulty) {
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

- (void)playerWon {
    gameEnded = YES;
    resultLabel.text = @"You Win!!";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    winCount++;
    winsLabel.text = [NSString stringWithFormat: @"Won: %i", winCount];
}

- (void)playerLost {
    gameEnded = YES;
    [self performSelector:@selector(setPlayerLost) withObject:self afterDelay:0.7];
}

- (void)setPlayerLost {
    resultLabel.text = @"You Lose :(";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:nil];
    loseCount++;
    lossesLabel.text = [NSString stringWithFormat: @"Lost: %i", loseCount];
}

- (void)catsTie {
    gameEnded = YES;
    resultLabel.text = @"Cat's";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (IBAction)startGame:(id)sender {
    if ([startGameButton.titleLabel.text isEqualToString:@"Start Game"]) {
        [self initialGame];
    } else if ([startGameButton.titleLabel.text isEqualToString:@"Reset Game"]) {
        [self resetGame];
    }
}

- (IBAction)tryAgain:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
    } completion:^(BOOL finished) {
        [gameResultsView setHidden:YES];
        [self resetGame];
    }];
}

- (IBAction)changeDifficulty:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
