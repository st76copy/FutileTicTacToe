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
    __weak IBOutlet UIButton        *startGameButton;
    __weak IBOutlet UIView          *gameResultsView;
}

- (IBAction)startGame:(id)sender;
- (IBAction)resetScores:(id)sender;
- (IBAction)tryAgain:(id)sender;


@end

@implementation ViewController

@synthesize wonTimerStarted, computerIsFirst, moveCount, loseCount, count, roundsCounter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    count = 0;
    //    playerMoves = [[NSMutableArray alloc] initWithCapacity:4];
    //    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    computerMovesFirst = [[ComputerMovesFirst alloc] init];
    playerMovesFirst = [[PlayerMovesFirst alloc] init];
    [computerMovesFirst initMutableArrays];
    [playerMovesFirst initMutableArrays];
    
    boardImageView.image = [UIImage imageNamed:@"board.png"];
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
    [self firstMove];
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
    } else {
        computerIsFirst = NO;
    }
    [self firstMove];
}

- (void)firstMove {
    NSLog(@"firstMove");
    if (computerIsFirst) {
        for (UIView *firstTile in self.view.subviews) {
            if (firstTile.tag == 1) {
                firstTile.backgroundColor = xBackground;
                [firstTile setUserInteractionEnabled:NO];
                [computerMovesFirst.computerMoves addObject:[NSNumber numberWithInteger:1]];
            }
        }
    }
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
- (void)computerMakesMove:(int)tagNumber {
    NSLog(@"computerMakesMove Delegate Fired");
    NSLog(@"tagNumber: %i", tagNumber);
    for (UIView *tileMove in self.view.subviews) {
        if (tileMove.tag == tagNumber) {
            tileMove.backgroundColor = xBackground;
            [tileMove setUserInteractionEnabled:NO];
            if (computerIsFirst) {
                [computerMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            } else {
                [playerMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            }
        }
    }
}

- (void)tileSelected:(Tiles *)tiles {
    moveCount++;
    NSLog(@"moveCount: %i", moveCount);
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

- (void)youLose {
    resultLabel.text = @"You Lose";
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [gameResultsView setHidden:NO];
    }];
    loseCount++;
    lossesLabel.text = [NSString stringWithFormat: @"Lost: %i", loseCount];
    if (!wonTimerStarted) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkWonCount) userInfo:nil repeats:YES];
    }
    if (loseCount == 5 || loseCount == 10) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkWonCount) userInfo:nil repeats:YES];
    }
    wonTimerStarted = YES;
}

- (void)catsTie {
    resultLabel.text = @"Cat's";
    [UIView animateWithDuration:0.3 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [gameResultsView setHidden:NO];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
