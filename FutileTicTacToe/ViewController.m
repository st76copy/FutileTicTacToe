//
//  ViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2s13 Jeremy Herrero. All rights reserved.
//

#import "ViewController.h"
#import "Tiles.h"
#import "ComputerMovesFirst.h"
#import "PlayerMovesFirst.h"

// I learned to create outlets here rather than in the header file because it keeps them private
@interface ViewController () {
    
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
- (IBAction)resetScores:(id)sender;
- (IBAction)tryAgain:(id)sender;
- (IBAction)changeDifficulty:(id)sender;


@end

@implementation ViewController

@synthesize normalDifficulty, wonTimerStarted, computerIsFirst, moveCount, winCount, loseCount, count, roundsCounter;

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
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[Tiles class]]) {
            Tiles *tiles = (Tiles *)subview;
            tiles.delegate = self;
        }
    }
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
    [computerMovesFirst firstMove];
}

- (void)resetGame {
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
        [computerMovesFirst firstMove];
    } else {
        computerIsFirst = NO;
    }
}

- (void)setNormalDifficulty:(BOOL)setToNormalDifficulty {
    if (!setToNormalDifficulty) {
        computerMovesFirst.normalDifficulty = NO;
        playerMovesFirst.normalDifficulty = NO;
    } else {
        computerMovesFirst.normalDifficulty = YES;
        playerMovesFirst.normalDifficulty = YES;
    }
    NSLog(@"difficulty was set to %d & %d", computerMovesFirst.normalDifficulty, playerMovesFirst.normalDifficulty);
}

- (void)blinkWonCount {
    if (count % 2 == 0) {
        winsLabel.text = @"Won:";
    } else if (count % 2 != 0) {
        winsLabel.text = @"Won: 0";
    }
    count++;
}

#pragma mark TilesDelegate
- (void)tileUserInteraction:(BOOL)enable {
    for (UIView *tileUserInteraction in self.view.subviews) {
        if (enable) {
            [tileUserInteraction setUserInteractionEnabled:YES];
        } else {
            [tileUserInteraction setUserInteractionEnabled:NO];
        }
    }
}

- (void)computerMakesMove:(int)tagNumber {
    NSLog(@"computerMakesMove Delegate Fired");
    NSLog(@"tagNumber: %i", tagNumber);
    [self tileUserInteraction:NO];
    for (UIView *tileMove in self.view.subviews) {
        if (tileMove.tag == tagNumber) {
            tileMove.backgroundColor = xBackground;
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
    NSLog(@"moveCount: %i", moveCount);
    NSLog(@"computerMoves: %@" , computerMovesFirst.computerMoves);
    if (computerIsFirst) {
        [computerMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        if (moveCount == 1) {
            [computerMovesFirst secondMove];
        } else if (moveCount == 2) {
            [computerMovesFirst thirdMove];
        } else if (moveCount == 3) {
            [computerMovesFirst fourthMove];
        } else if (moveCount == 4) {
            [computerMovesFirst fifthMove];
        }
    } else {
        [playerMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        if (moveCount == 1) {
            [playerMovesFirst firstMove];
        } else if (moveCount == 2) {
            [playerMovesFirst secondMove];
        } else if (moveCount == 3) {
            [playerMovesFirst thirdMove];
        } else if (moveCount == 4) {
            [playerMovesFirst fourthMove];
        } else if (moveCount == 5) {
            [playerMovesFirst fifthMove];
        }
    }
}

- (void)playerWon {
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
    resultLabel.text = @"You Lose :(";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    loseCount++;
    lossesLabel.text = [NSString stringWithFormat: @"Lost: %i", loseCount];
    if (computerMovesFirst.normalDifficulty == YES) {
        if (!wonTimerStarted) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkWonCount) userInfo:nil repeats:YES];
        }
        if (loseCount == 5 || loseCount == 10) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkWonCount) userInfo:nil repeats:YES];
        }
        wonTimerStarted = YES;
    }
}

- (void)catsTie {
    resultLabel.text = @"Cat's";
    [gameResultsView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)startGame:(id)sender {
    if ([startGameButton.titleLabel.text isEqualToString:@"Start Game"]) {
        [self initialGame];
    } else if ([startGameButton.titleLabel.text isEqualToString:@"Reset Game"]) {
        [self resetGame];
    }
}

- (IBAction)resetScores:(id)sender {
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
    [self dismissViewControllerAnimated:YES completion:^{
        gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
        [gameResultsView setHidden:YES];
        winCount = 0;
        loseCount = 0;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
