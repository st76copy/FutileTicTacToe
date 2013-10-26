//
//  ComputerFirstMove.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "ComputerMovesFirst.h"

@implementation ComputerMovesFirst

@synthesize standardAutomatedMove, tiles, randomizer, compDoesNotHaveBothGoldenCorners, compHasAllThreeCorners, compHasCornersHumanHasCenter, compHasCornersNoHumanCenter, delegate;

//- (void)initMutableArrays {
//    tiles.computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
//    tiles.playerMoves = [[NSMutableArray alloc] initWithCapacity:5];
//}

- (void)easyPlayRandomizedMove {
    randomizer = arc4random() % 2;
    switch (randomizer) {
        case 0: [standardAutomatedMove attempWinningMove];
            break;
        default: [standardAutomatedMove fillInAnySquare];
            break;
    }
}

- (void)firstMove:(BOOL)normalPlay {
    standardAutomatedMove.finalMove = NO;
    if (normalPlay) {
        [delegate computerMakesMove:1];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)secondMove:(BOOL)normalPlay {
    BOOL moveMade = NO;
    if (normalPlay) {
        if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                self.compHasCornersNoHumanCenter = YES;
                [delegate computerMakesMove:3];
                moveMade = YES;
            } else  {
                self.compHasCornersNoHumanCenter = YES;
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            self.compDoesNotHaveBothGoldenCorners = YES;
            [delegate computerMakesMove:3];
            moveMade = YES;
        } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersHumanHasCenter = YES;
            [delegate computerMakesMove:9];
            moveMade = YES;
        }
        if (!moveMade) {
            [standardAutomatedMove attempWinningMove];
        }
        [standardAutomatedMove winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)thirdMove:(BOOL)normalPlay {
    BOOL moveMade = NO;
    if (normalPlay) {
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersNoHumanCenter = NO;
        }
        if (self.compHasCornersNoHumanCenter) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:8];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:6];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                self.compHasAllThreeCorners = YES;
                [delegate computerMakesMove:7];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
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
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:7];
                moveMade = YES;
            }
        }
        
        else if (self.compHasCornersHumanHasCenter) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:7];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:3];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:8];
                moveMade = YES;
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:6];
                moveMade = YES;
            }
        }
        
        else if (!self.compHasCornersHumanHasCenter && !self.compHasCornersNoHumanCenter) {
            if (!self.compDoesNotHaveBothGoldenCorners && !self.compHasAllThreeCorners) {
                if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
                    [delegate computerMakesMove:2];
                    moveMade = YES;                }
            }
        }
        if (!moveMade) {
            [standardAutomatedMove attempWinningMove];
        }
        [standardAutomatedMove winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fourthMove:(BOOL)normalPlay {
    BOOL moveMade = NO;
    if (normalPlay) {
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            self.compHasCornersNoHumanCenter = NO;
        }
        if (self.compHasAllThreeCorners) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                moveMade = YES;
            } else if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:6];
                    moveMade = YES;
                }
            }
        }
        
        else if (self.compHasCornersNoHumanCenter) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                } else if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:9];
                    moveMade = YES;
                }
            } else if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                } else if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:9];
                } else if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                    [delegate computerMakesMove:8];
                    moveMade = YES;
                }
            }
        }
        
        else if (self.compDoesNotHaveBothGoldenCorners) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                moveMade = YES;
            } else if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                moveMade = YES;
            }
        }
        
        else if (self.compHasCornersHumanHasCenter) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                moveMade = YES;
            } else if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if (![tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                    [delegate computerMakesMove:6];
                    moveMade = YES;
                }
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
                if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                        [delegate computerMakesMove:3];
                        moveMade = YES;
                    }
                }
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                        [delegate computerMakesMove:7];
                        moveMade = YES;
                    }
                }
            } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                    [delegate computerMakesMove:7];
                    moveMade = YES;
                } else if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                    [delegate computerMakesMove:3];
                    moveMade = YES;
                }
            } else if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                    [delegate computerMakesMove:8];
                    moveMade = YES;
                }
            }
        }
        if (!moveMade) {
            [standardAutomatedMove attempWinningMove];
        }
        [standardAutomatedMove winCheck];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fifthMove:(BOOL)normalPlay {
    standardAutomatedMove.finalMove = YES;
    [standardAutomatedMove fillInAnySquare];
}

@end
