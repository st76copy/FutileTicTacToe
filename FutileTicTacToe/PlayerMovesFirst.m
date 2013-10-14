//
//  PlayerMovesFirst.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/1/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "PlayerMovesFirst.h"

@implementation PlayerMovesFirst

@synthesize randomizer, finalMove, computerMoves, playerMoves, delegate;

- (void)initMutableArrays {
    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    playerMoves = [[NSMutableArray alloc] initWithCapacity:5];
}

- (void)easyPlayRandomizedMove {
    randomizer = arc4random() % 2;
    NSLog(@"randomizer: %i", randomizer);
    switch (randomizer) {
        case 0: [self attempWinningMove];
            break;
        default: [self fillInAnySquare];
            break;
    }
}

- (void)firstMove:(BOOL)normalPlay {
    NSLog(@"first move");
    finalMove = NO;
    if (normalPlay) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [computerMoves addObject:[NSNumber numberWithInt:5]];
            [delegate computerMakesMove:5];
        } else {
            int move = arc4random() % 7 + 1;
            if (move % 2 != 0) {
                move++;
            }
            [computerMoves addObject:[NSNumber numberWithInt:move]];
            [delegate computerMakesMove:move];
        }
    } else {
        if (![computerMoves containsObject:[NSNumber numberWithInt:4]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [delegate computerMakesMove:4];
        } else if (![computerMoves containsObject:[NSNumber numberWithInt:8]] && ![playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [delegate computerMakesMove:8];
        }
    }
}


- (void)secondMove:(BOOL)normalPlay {
    NSLog(@"second move");
    if (normalPlay) {
        [self attempWinningMove];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)thirdMove:(BOOL)normalPlay {
    if (normalPlay) {
        [self attempWinningMove];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fourthMove:(BOOL)normalPlay {
    if (normalPlay) {
        [self attempWinningMove];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fifthMove {
    finalMove = YES;
    [self winCheck];
}

- (void)attempWinningMove {
    BOOL winningMoveAttempted = NO;
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:3];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:1];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:2];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:7];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:4];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:1];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:9];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:6]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:3];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:6];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:4];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:9];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:8];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:8]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:7];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:9];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:1];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:7];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:3];
                [self winCheck];
            }
        }
    }
    if (!winningMoveAttempted) {
        [self checkIfBlockIsNeeded];
    }
}

- (void)checkIfBlockIsNeeded {
    NSLog(@"called CheckIfBlockIsNeeded");
    BOOL moveMade = NO;
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [computerMoves addObject:[NSNumber numberWithInt:2]];
                [delegate computerMakesMove:2];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                [self winCheck];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [computerMoves addObject:[NSNumber numberWithInt:6]];
                [delegate computerMakesMove:6];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [computerMoves addObject:[NSNumber numberWithInt:4]];
                [delegate computerMakesMove:4];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [computerMoves addObject:[NSNumber numberWithInt:5]];
                [delegate computerMakesMove:5];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![computerMoves containsObject:[NSNumber numberWithInt:4]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [computerMoves addObject:[NSNumber numberWithInt:4]];
                [delegate computerMakesMove:4];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [computerMoves addObject:[NSNumber numberWithInt:6]];
                [delegate computerMakesMove:6];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [computerMoves addObject:[NSNumber numberWithInt:8]];
                [delegate computerMakesMove:8];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        [self fillInAnySquare];
    } else {
        [self winCheck];
    }
}

- (void)fillInAnySquare {
    NSLog(@"fillInAnySqare called");
    BOOL spaceFilled = NO;
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            NSLog(@"fillInAnySqare 2");
            [computerMoves addObject:[NSNumber numberWithInt:2]];
            [delegate computerMakesMove:2];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            NSLog(@"fillInAnySqare 8");
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [delegate computerMakesMove:8];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            NSLog(@"fillInAnySqare 6");
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [delegate computerMakesMove:6];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            NSLog(@"fillInAnySqare 4");
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [delegate computerMakesMove:4];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            NSLog(@"fillInAnySqare 5");
            [computerMoves addObject:[NSNumber numberWithInt:5]];
            [delegate computerMakesMove:5];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            NSLog(@"fillInAnySqare 3");
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            [delegate computerMakesMove:3];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            NSLog(@"fillInAnySqare 9");
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            [delegate computerMakesMove:9];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            NSLog(@"fillInAnySqare 7");
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [delegate computerMakesMove:7];
            spaceFilled = YES;
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
            NSLog(@"fillInAnySqare 1");
            [computerMoves addObject:[NSNumber numberWithInt:1]];
            [delegate computerMakesMove:1];
            spaceFilled = YES;
        }
    }
    [self winCheck];
}

#pragma mark TilesDelegate
- (void)winCheck {
    NSLog(@"winCheck called");
    BOOL gameOver = NO;
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
            }
        }
    }
    if (!gameOver) {
        if (finalMove == YES) {
            finalMove = NO;
            gameOver = YES;
            [delegate catsTie];
        }
    }
}

@end
