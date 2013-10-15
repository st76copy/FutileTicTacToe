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
        [delegate computerMakesMove:1];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)secondMove:(BOOL)normalPlay {
    BOOL moveMade = NO;
    if (normalPlay) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                self.compHasCornersNoHumanCenter = YES;
                [delegate computerMakesMove:3];
                moveMade = YES;
            } else  {
                self.compHasCornersNoHumanCenter = YES;
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            self.compDoesNotHaveBothGoldenCorners = YES;
            [delegate computerMakesMove:3];
            moveMade = YES;
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersHumanHasCenter = YES;
            [delegate computerMakesMove:9];
            moveMade = YES;
        }
        if (!moveMade) {
            [self attempWinningMove];
        }
        [self winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)thirdMove:(BOOL)normalPlay {
    BOOL moveMade = NO;
    if (normalPlay) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersNoHumanCenter = NO;
        }
        if (self.compHasCornersNoHumanCenter) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:8];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:6];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                self.compHasAllThreeCorners = YES;
                [delegate computerMakesMove:7];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
                self.compHasAllThreeCorners = YES;
                [delegate computerMakesMove:9];
                moveMade = YES;
            }
            else {
                [delegate computerMakesMove:5];
                moveMade = YES;
            }
        }
        
        else if (self.compDoesNotHaveBothGoldenCorners) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
        
        else if (self.compHasCornersHumanHasCenter) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:7];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:3];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:8];
                moveMade = YES;
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:6];
                moveMade = YES;
            }
        }
        
        else if (!self.compHasCornersHumanHasCenter && !self.compHasCornersNoHumanCenter) {
            if (!self.compDoesNotHaveBothGoldenCorners && !self.compHasAllThreeCorners) {
                if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
                    [delegate computerMakesMove:2];
                    moveMade = YES;                }
            }
        }
        if (!moveMade) {
            [self attempWinningMove];
        }
        [self winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
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
                moveMade = YES;
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:6];
                    moveMade = YES;
                }
            }
        }
        
        else if (self.compHasCornersNoHumanCenter) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:9];
                    moveMade = YES;
                }
            } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:9];
                } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                    [delegate computerMakesMove:8];
                    moveMade = YES;
                }
            }
        }
        
        else if (self.compDoesNotHaveBothGoldenCorners) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                moveMade = YES;
            }
        }
        
        else if (self.compHasCornersHumanHasCenter) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if (![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                    [delegate computerMakesMove:6];
                    moveMade = YES;
                }
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                        [delegate computerMakesMove:3];
                        moveMade = YES;
                    }
                }
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                        [delegate computerMakesMove:7];
                        moveMade = YES;
                    }
                }
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                }
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:8];
                    moveMade = YES;
                }
            }
        }
        if (!moveMade) {
            [self attempWinningMove];
        }
        [self winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fifthMove:(BOOL)normalPlay {
    finalMove = YES;
    [self fillInAnySquare];
}

- (void)attempWinningMove {
    for (int arbitrary = 0; arbitrary < 1; arbitrary++) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:6]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:8]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [self winCheck];
                break;
            }
        }
        [self checkIfBlockIsNeeded];
        break;
    }
}


- (void)checkIfBlockIsNeeded {
    for (int arbitrary = 0; arbitrary < 1; arbitrary++) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![computerMoves containsObject:[NSNumber numberWithInt:4]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                break;
            }
        }
        
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        [self fillInAnySquare];
        [self winCheck];
    }
}

- (void)fillInAnySquare {
    for (int tileInt = 1; tileInt < 10; tileInt++) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:tileInt]] && ![computerMoves containsObject:[NSNumber numberWithInt:tileInt]]) {
            [delegate computerMakesMove:tileInt];
            [self winCheck];
            break;
        }
    }
}

#pragma mark TilesDelegate
- (void)winCheck {
    BOOL gameOver = NO;
    for (int arbitrary = 0; arbitrary < 1; arbitrary++) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if (finalMove == YES) {
            finalMove = NO;
            gameOver = YES;
            [self performSelector:@selector(catsTie) withObject:self afterDelay:0.7];
            break;
        }
    }
}

- (void)catsTie {
    [delegate catsTie];
}

@end
