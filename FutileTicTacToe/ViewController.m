//
//  ViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2s13 Jeremy Herrero. All rights reserved.
//

#import "ViewController.h"
#import "Tiles.h"

// I learned to create outlets here rather than in the header file because it keeps them private
@interface ViewController () {
    
    BOOL                            compHasCornersNoHumanCenter;
    BOOL                            compHasCornersHumanHasCenter;
    BOOL                            compDoesNotHaveBothGoldenCorners;
    BOOL                            compHasAllThreeCorners;
    BOOL                            wonTimerStarted;
    int                             moveCount;
    int                             loseCount;
    int                             count;
    NSTimer                         *timer;
    UIColor                         *xBackground;
    NSMutableArray                  *computerMoves;
    NSMutableArray                  *playerMoves;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    count = 0;
    playerMoves = [[NSMutableArray alloc] initWithCapacity:4];
    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    
    boardImageView.image = [UIImage imageNamed:@"board.png"];
    gameResultsView.transform = CGAffineTransformScale(gameResultsView.transform, 0.01, 0.01);
    [gameResultsView setHidden:YES];
    
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
    compHasCornersNoHumanCenter = NO;
    compHasCornersHumanHasCenter = NO;
    compDoesNotHaveBothGoldenCorners = NO;
    compHasAllThreeCorners = NO;
    [self firstMove];
}

- (void)resetGame {
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
        tile.backgroundColor = [UIColor whiteColor];
    }
    [playerMoves removeAllObjects];
    [computerMoves removeAllObjects];
    moveCount = 0;
    compHasCornersNoHumanCenter = NO;
    compHasCornersHumanHasCenter = NO;
    compDoesNotHaveBothGoldenCorners = NO;
    compHasAllThreeCorners = NO;
    [self firstMove];
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
    if (loseCount == 5 || loseCount == 10) {
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

- (void)blinkWonCount {
    if (count % 2 == 0) {
        winsLabel.text = @"Won:";
    } else if (count % 2 != 0) {
        winsLabel.text = @"Won: 0";
    }
    count++;
}

- (void)firstMove {
    NSLog(@"firstMove");
    for (UIView *firstTile in self.view.subviews) {
        if (firstTile.tag == 1) {
            firstTile.backgroundColor = xBackground;
            [firstTile setUserInteractionEnabled:NO];
            [computerMoves addObject:[NSNumber numberWithInteger:1]];
        }
    }
}

- (void)secondMove {
    NSLog(@"secondMove");
    if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            compHasCornersNoHumanCenter = YES;
            [self computerMakesMove:3];
        } else  {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            compHasCornersNoHumanCenter = YES;
            [self computerMakesMove:7];
        }
    } else if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
        [computerMoves addObject:[NSNumber numberWithInt:3]];
        compDoesNotHaveBothGoldenCorners = YES;
        [self computerMakesMove:3];
    } else if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
        [computerMoves addObject:[NSNumber numberWithInt:9]];
        compHasCornersHumanHasCenter = YES;
        [self computerMakesMove:9];
    }
}

- (void)thirdMove {
    NSLog(@"thirdMove");
    if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
        compHasCornersNoHumanCenter = NO;
    }
    
    //    NSLog(@"third move noCenter:%d  center:%d  noBoth:%d", compHasCornersNoHumanCenter, compHasCornersHumanHasCenter, compDoesNotHaveBothGoldenCorners);
    
    if (compHasCornersNoHumanCenter) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [self computerMakesMove:4];
            [self youLose];
        } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [self computerMakesMove:2];
            [self youLose];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [self computerMakesMove:8];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [self computerMakesMove:6];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            compHasAllThreeCorners = YES;
            [self computerMakesMove:7];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            compHasAllThreeCorners = YES;
            [self computerMakesMove:9];
        }
        else {
            [computerMoves addObject:[NSNumber numberWithInt:5]];
            [self computerMakesMove:5];
        }
    }
    
    else if (compDoesNotHaveBothGoldenCorners) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [self computerMakesMove:2];
            [self youLose];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [self computerMakesMove:7];
        }
    }
    
    else if (compHasCornersHumanHasCenter) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [self computerMakesMove:7];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            [self computerMakesMove:3];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [self computerMakesMove:4];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:2]];
            [self computerMakesMove:2];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [self computerMakesMove:8];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [self computerMakesMove:6];
        }
    }
    
    else if (!compHasCornersHumanHasCenter && !compHasCornersNoHumanCenter) {
        if (!compDoesNotHaveBothGoldenCorners && !compHasAllThreeCorners) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [self computerMakesMove:2];
                [self youLose];
            }
        }
    }
}

- (void)fourthMove {
    NSLog(@"forthMove");
    if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
        compHasCornersNoHumanCenter = NO;
    }
    
    if (compHasAllThreeCorners) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [self computerMakesMove:5];
            [self youLose];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [self computerMakesMove:6];
                [self youLose];
            }
        }
    }
    
    else if (compHasCornersNoHumanCenter) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [self computerMakesMove:3];
                [self youLose];
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [self computerMakesMove:9];
                [self youLose];
            }
        } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [self computerMakesMove:7];
                [self youLose];
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [self computerMakesMove:9];
                [self youLose];
            }
        }
    }
    
    else if (compDoesNotHaveBothGoldenCorners) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [self computerMakesMove:4];
            [self youLose];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [self computerMakesMove:5];
            [self youLose];
        }
    }
    
    else if (compHasCornersHumanHasCenter) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [self computerMakesMove:2];
            [self youLose];
        } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [self computerMakesMove:6];
            [self youLose];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [self computerMakesMove:7];
                [self youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [self computerMakesMove:3];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [self computerMakesMove:3];
                [self youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [self computerMakesMove:7];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [self computerMakesMove:7];
                [self youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [self computerMakesMove:3];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [self computerMakesMove:8];
                [self youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [self computerMakesMove:7];
            }
        }
    }
    
}

- (void)fifthMove {
    if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
        [self computerMakesMove:2];
        [self catsTie];
    } else if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
        [self computerMakesMove:4];
        [self catsTie];
    } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
        [self computerMakesMove:6];
        [self catsTie];
    } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
        [self computerMakesMove:8];
        [self catsTie];
    }
}

- (void)computerMakesMove:(int)tagNumber {
    for (UIView *tileMove in self.view.subviews) {
        if (tileMove.tag == tagNumber) {
            tileMove.backgroundColor = xBackground;
            [tileMove setUserInteractionEnabled:NO];
            [computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
        }
    }
}

#pragma mark TilesDelegate
- (void)tileSelected:(Tiles *)tiles {
    [playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
    moveCount++;
    if (moveCount == 1) {
        [self secondMove];
    } else if (moveCount == 2) {
        [self thirdMove];
    } else if (moveCount == 3) {
        [self fourthMove];
    } else if (moveCount == 4) {
        [self fifthMove];
    }
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
