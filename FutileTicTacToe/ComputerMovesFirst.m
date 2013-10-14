//
//  ComputerFirstMove.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "ComputerMovesFirst.h"

@implementation ComputerMovesFirst

@synthesize randomizer, compDoesNotHaveBothGoldenCorners, compHasAllThreeCorners, compHasCornersHumanHasCenter, compHasCornersNoHumanCenter, finalMove, computerMoves, playerMoves, delegate;

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
    finalMove = NO;
    if (normalPlay) {
        [computerMoves addObject:[NSNumber numberWithInteger:1]];
        [delegate computerMakesMove:1];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)secondMove:(BOOL)normalPlay {
    if (normalPlay) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                self.compHasCornersNoHumanCenter = YES;
                [delegate computerMakesMove:3];
            } else  {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                self.compHasCornersNoHumanCenter = YES;
                [delegate computerMakesMove:7];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            self.compDoesNotHaveBothGoldenCorners = YES;
            [delegate computerMakesMove:3];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            self.compHasCornersHumanHasCenter = YES;
            [delegate computerMakesMove:9];
        }
        [self winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)thirdMove:(BOOL)normalPlay {
    NSLog(@"thirdMove");
    BOOL moveMade = NO;
    if (normalPlay) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersNoHumanCenter = NO;
        }
        if (self.compHasCornersNoHumanCenter) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [delegate playerLost];
                moveMade = YES;
            } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                [delegate playerLost];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:8]];
                [delegate computerMakesMove:8];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:6]];
                [delegate computerMakesMove:6];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                self.compHasAllThreeCorners = YES;
                [delegate computerMakesMove:7];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                self.compHasAllThreeCorners = YES;
                [delegate computerMakesMove:9];
                moveMade = YES;
            }
            else {
                [computerMoves addObject:[NSNumber numberWithInt:5]];
                [delegate computerMakesMove:5];
                moveMade = YES;
            }
        }
        
        else if (self.compDoesNotHaveBothGoldenCorners) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                [delegate playerLost];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
        
        else if (self.compHasCornersHumanHasCenter) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [computerMoves addObject:[NSNumber numberWithInt:4]];
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [computerMoves addObject:[NSNumber numberWithInt:2]];
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [computerMoves addObject:[NSNumber numberWithInt:8]];
                [delegate computerMakesMove:8];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [computerMoves addObject:[NSNumber numberWithInt:6]];
                [delegate computerMakesMove:6];
                moveMade = YES;
            }
        }
        
        else if (!self.compHasCornersHumanHasCenter && !self.compHasCornersNoHumanCenter) {
            if (!self.compDoesNotHaveBothGoldenCorners && !self.compHasAllThreeCorners) {
                if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
                    [delegate computerMakesMove:2];
                    [delegate playerLost];
                    moveMade = YES;
                }
            }
        }
        if (!moveMade) {
            [self attempWinningMove];
        }
    } else {
        [self easyPlayRandomizedMove];
    }
    [self winCheck];
}

- (void)fourthMove:(BOOL)normalPlay {
    BOOL moveMade = NO;
    if (normalPlay) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersNoHumanCenter = NO;
        }
        if (self.compHasAllThreeCorners) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [delegate playerLost];
                moveMade = YES;
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:6];
                    [delegate playerLost];
                    moveMade = YES;
                }
            }
        }
        
        else if (self.compHasCornersNoHumanCenter) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    [delegate playerLost];
                    moveMade = YES;
                } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:9];
                    [delegate playerLost];
                    moveMade = YES;
                }
            } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    [delegate playerLost];
                    moveMade = YES;
                } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:9];
                    [delegate playerLost];
                    moveMade = YES;
                } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                    [delegate computerMakesMove:8];
                    [delegate playerLost];
                    moveMade = YES;
                }
            }
        }
        
        else if (self.compDoesNotHaveBothGoldenCorners) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [delegate playerLost];
                moveMade = YES;
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [delegate playerLost];
                moveMade = YES;
            }
        }
        
        else if (self.compHasCornersHumanHasCenter) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                [delegate playerLost];
                moveMade = YES;
            } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if (![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                    [delegate computerMakesMove:6];
                    [delegate playerLost];
                    moveMade = YES;
                }
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    [delegate playerLost];
                    moveMade = YES;
                } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                        [computerMoves addObject:[NSNumber numberWithInt:3]];
                        [delegate computerMakesMove:3];
                        moveMade = YES;
                    }
                }
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    [delegate playerLost];
                    moveMade = YES;
                } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                        [computerMoves addObject:[NSNumber numberWithInt:7]];
                        [delegate computerMakesMove:7];
                        moveMade = YES;
                    }
                }
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                    [delegate playerLost];
                } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [computerMoves addObject:[NSNumber numberWithInt:3]];
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                }
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:8];
                    [delegate playerLost];
                    moveMade = YES;
                }
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [delegate playerLost];
                moveMade = YES;
            }
        }
        if (!moveMade) {
            [self attempWinningMove];
        }
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fifthMove:(BOOL)normalPlay {
    finalMove = YES;
    [self fillInAnySquare];
}

- (void)attempWinningMove {
    BOOL winningMoveAttempted = NO;
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:3];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:1];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:2];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:7];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:4];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:1];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:9];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:6]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:3];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:6];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:4];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:9];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:8];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:8]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:7];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:9];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:1];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:7];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:5];
                [delegate playerLost];
            }
        }
    }
    if (!winningMoveAttempted) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                winningMoveAttempted = YES;
                [delegate computerMakesMove:3];
                [delegate playerLost];
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
            [self performSelector:@selector(catsTie) withObject:self afterDelay:0.7];
        }
    }
}

- (void)catsTie {
    [delegate catsTie];
}

@end
