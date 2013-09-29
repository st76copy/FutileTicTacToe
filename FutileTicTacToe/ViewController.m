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
    
    //    Tiles                           *tiles;
    BOOL                            bestStart;
    int                             moveCount;
    UIColor                         *xBackground;
    NSMutableArray                  *computerMoves;
    NSMutableArray                  *playerMoves;
    __weak IBOutlet UILabel         *winsLabel;
    __weak IBOutlet UILabel         *lossesLabel;
    __weak IBOutlet UIImageView     *boardImageView;
    __weak IBOutlet UIButton        *startGameButton;
}
- (IBAction)startGame:(id)sender;
- (IBAction)resetScores:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    playerMoves = [[NSMutableArray alloc] initWithCapacity:4];
    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[Tiles class]]) {
            Tiles *tiles = (Tiles *)subview;
            tiles.delegate = self;
        }
    }
    
    boardImageView.image = [UIImage imageNamed:@"board.png"];
}

- (void)initialGame {
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
    }
    [startGameButton setTitle:@"Reset Game" forState:UIControlStateNormal];
//    startGameButton.titleLabel.text = @"Reset Game";
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
    [self firstMove];
}

- (void)firstMove {
    
    for (UIView *firstTile in self.view.subviews) {
        if (firstTile.tag == 1) {
            firstTile.backgroundColor = xBackground;
            [firstTile setUserInteractionEnabled:NO];
            [computerMoves addObject:[NSNumber numberWithInteger:1]];
        }
    }
}

- (void)secondMove {
    if (![playerMoves containsObject:[NSNumber numberWithInteger:9]]) {
        [self computerMakesMove:9];
        bestStart = YES;
    } else if ([playerMoves containsObject:[NSNumber numberWithInteger:9]]) {
        [self computerMakesMove:3];
        bestStart = NO;
    }
}

- (void)thirdMove {
//    if (bestStart) {
        if ([playerMoves containsObject:[NSNumber numberWithInteger:2]] && ![playerMoves containsObject:[NSNumber numberWithInteger:8]]) {
            [self computerMakesMove:8];
        } else if ([playerMoves containsObject:[NSNumber numberWithInteger:4]] && ![playerMoves containsObject:[NSNumber numberWithInteger:6]]) {
            [self computerMakesMove:6];
        } else if ([playerMoves containsObject:[NSNumber numberWithInteger:6]] && ![playerMoves containsObject:[NSNumber numberWithInteger:4]]) {
            [self computerMakesMove:4];
        } else if ([playerMoves containsObject:[NSNumber numberWithInteger:8]] && ![playerMoves containsObject:[NSNumber numberWithInteger:2]]) {
            [self computerMakesMove:2];
        } else if ([computerMoves containsObject:[NSNumber numberWithBool:9]] && ![playerMoves containsObject:[NSNumber numberWithInteger:5]]) {
            [self computerMakesMove:5];
        } else if (![playerMoves containsObject:[NSNumber numberWithInteger:3]]) {
            [self computerMakesMove:3];
        } else if (![playerMoves containsObject:[NSNumber numberWithInteger:7]]) {
            [self computerMakesMove:7];
        }
//    }
}

- (void)fourthMove:(BOOL)bestStartWin {
//    if (bestStartWin) {
        if ([computerMoves containsObject:[NSNumber numberWithInteger:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInteger:2]]) {
                [self computerMakesMove:2];
            } else if (![playerMoves containsObject:[NSNumber numberWithInteger:6]]) {
                [self computerMakesMove:6];
            }
        }
//    }
}

- (void)fifthMove {
    
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
        if (bestStart) {
            [self fourthMove:YES];
        } else {
            [self fourthMove:NO];
        }
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
