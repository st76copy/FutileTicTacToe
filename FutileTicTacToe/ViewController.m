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
#import "HumanMovesFirst.h"

// I learned to create outlets here rather than in the header file because it keeps them private
@interface ViewController () {
    
    BOOL                            computerIsFirst;
    BOOL                            wonTimerStarted;
    int                             loseCount;
    int                             count;
    int                             moveCount;
    ComputerMovesFirst              *computerFirstMove;
    HumanMovesFirst                 *humanMovesFirst;
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
- (IBAction)tryAgain:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    count = 0;
    xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    computerFirstMove = [[ComputerMovesFirst alloc] init];
    [computerFirstMove initMutableArrays];
    humanMovesFirst = [[HumanMovesFirst alloc] init];
    [humanMovesFirst initMutableArrays];
    computerIsFirst = NO;
    
    boardImageView.image = [UIImage imageNamed:@"board.png"];
    gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
    [gameResultsView setHidden:YES];
    
    computerFirstMove.delegate = self;
    humanMovesFirst.delegate = self;
    
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
    [startGameButton setHidden:YES];
    [startGameButton setTitle:@"Reset Game" forState:UIControlStateNormal];
    //    computerFirstMove.compHasCornersNoHumanCenter = NO;
    //    computerFirstMove.compHasCornersHumanHasCenter = NO;
    //    computerFirstMove.compDoesNotHaveBothGoldenCorners = NO;
    //    computerFirstMove.compHasAllThreeCorners = NO;
    [self firstMove];
}

- (void)resetGame {
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
        tile.backgroundColor = [UIColor whiteColor];
    }
    [computerFirstMove.playerMoves removeAllObjects];
    [computerFirstMove.computerMoves removeAllObjects];
    moveCount = 0;
    
    [computerFirstMove resetAll];
    [humanMovesFirst resetAll];
    [self firstMove];
}

- (void)firstMove {
    NSLog(@"firstMove");
    if (computerIsFirst) {
        for (UIView *firstTile in self.view.subviews) {
            if (firstTile.tag == 1) {
                firstTile.backgroundColor = xBackground;
                [firstTile setUserInteractionEnabled:NO];
                [computerFirstMove.computerMoves addObject:[NSNumber numberWithInteger:1]];
            }
        }
    } else {
        [self tileSelected:nil];
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
    if (computerIsFirst) {
        for (UIView *tileMove in self.view.subviews) {
            if (tileMove.tag == tagNumber) {
                tileMove.backgroundColor = xBackground;
                [tileMove setUserInteractionEnabled:NO];
                [computerFirstMove.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            }
        }
    } else if (!computerIsFirst) {
        for (UIView *tileMove in self.view.subviews) {
            if (tileMove.tag == tagNumber) {
                tileMove.backgroundColor = xBackground;
                [tileMove setUserInteractionEnabled:NO];
                [humanMovesFirst.computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
            }
        }
    }
}

- (void)tileSelected:(Tiles *)tiles {
    moveCount++;
    NSLog(@"moveCount: %i", moveCount);
    if (computerIsFirst) {
        [computerFirstMove.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        if (moveCount == 1) {
            [computerFirstMove secondMove];
        } else if (moveCount == 2) {
            [computerFirstMove thirdMove];
        } else if (moveCount == 3) {
            [computerFirstMove fourthMove];
        } else if (moveCount == 4) {
            [computerFirstMove fifthMove];
        }
    } else if (!computerIsFirst) {
        [humanMovesFirst.playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
        if (moveCount == 2) {
            [humanMovesFirst secondMove];
        } else if (moveCount == 3) {
            [humanMovesFirst thirdMove];
        } else if (moveCount == 4) {
            [humanMovesFirst fourthMove];
        } else if (moveCount == 5) {
            [humanMovesFirst fifthMove];
        } else if (moveCount == 6) {
            [humanMovesFirst sixthMove];
        }
    }
}

- (void)youLose {
    resultLabel.text = @"You Lose";
    [UIView animateWithDuration:0.03 animations:^{
        gameResultsView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [gameResultsView setHidden:NO];
    }];
    loseCount++;
    lossesLabel.text = [NSString stringWithFormat: @"Lost: %i", loseCount];
    if (!wonTimerStarted) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkWonCount) userInfo:nil repeats:YES];
    }
    wonTimerStarted = YES;
}

- (void)catsTie {
    resultLabel.text = @"Cat's";
    [UIView animateWithDuration:0.03 animations:^{
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

- (IBAction)tryAgain:(id)sender {
    [UIView animateWithDuration:0.03 animations:^{
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
