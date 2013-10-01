//
//  ComputerFirstMove.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "ComputerMovesFirst.h"

@implementation ComputerMovesFirst

@synthesize compDoesNotHaveBothGoldenCorners, compHasAllThreeCorners, compHasCornersHumanHasCenter, compHasCornersNoHumanCenter, computerMoves, playerMoves, delegate;

- (void)initMutableArrays {
    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    playerMoves = [[NSMutableArray alloc] initWithCapacity:5];
}

- (void)secondMove {
    NSLog(@"secondMove");
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
}

- (void)thirdMove {
    NSLog(@"thirdMove");
    if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
        self.compHasCornersNoHumanCenter = NO;
    }
    
    //    NSLog(@"third move noCenter:%d  center:%d  noBoth:%d", compHasCornersNoHumanCenter, compHasCornersHumanHasCenter, compDoesNotHaveBothGoldenCorners);
    
    if (self.compHasCornersNoHumanCenter) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && ![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [delegate computerMakesMove:4];
            [delegate youLose];
        } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [delegate computerMakesMove:2];
            [delegate youLose];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [delegate computerMakesMove:8];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [delegate computerMakesMove:6];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            self.compHasAllThreeCorners = YES;
            [delegate computerMakesMove:7];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            self.compHasAllThreeCorners = YES;
            [delegate computerMakesMove:9];
        }
        else {
            [computerMoves addObject:[NSNumber numberWithInt:5]];
            [delegate computerMakesMove:5];
        }
    }
    
    else if (self.compDoesNotHaveBothGoldenCorners) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [delegate computerMakesMove:2];
            [delegate youLose];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [delegate computerMakesMove:7];
        }
    }
    
    else if (self.compHasCornersHumanHasCenter) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [delegate computerMakesMove:7];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            [delegate computerMakesMove:3];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [delegate computerMakesMove:4];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:2]];
            [delegate computerMakesMove:2];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [delegate computerMakesMove:8];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [delegate computerMakesMove:6];
        }
    }
    
    else if (!self.compHasCornersHumanHasCenter && !self.compHasCornersNoHumanCenter) {
        if (!self.compDoesNotHaveBothGoldenCorners && !self.compHasAllThreeCorners) {
            if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:2];
                [delegate youLose];
            }
        }
    }
}

- (void)fourthMove {
    NSLog(@"fourthMove");
    if ([playerMoves containsObject:[NSNumber numberWithInt:5]]) {
        self.compHasCornersNoHumanCenter = NO;
    }
    NSLog(@"compHasCornersNoHumanCenter %d, compHasAllThreeCorners %d, compHasCornersNoHumanCenter %d, compDoesNotHaveBothGoldenCorners %d, compHasCornersHumanHasCenter %d", compHasCornersNoHumanCenter, compHasAllThreeCorners, compHasCornersNoHumanCenter, compDoesNotHaveBothGoldenCorners, compHasCornersHumanHasCenter);
    if (self.compHasAllThreeCorners) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [delegate computerMakesMove:5];
            [delegate youLose];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:6];
                [delegate youLose];
            }
        }
    }
    
    else if (self.compHasCornersNoHumanCenter) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [delegate youLose];
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [delegate youLose];
            }
        } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [delegate youLose];
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [delegate youLose];
            } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                [delegate youLose];
            }
        }
    }
    
    else if (self.compDoesNotHaveBothGoldenCorners) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [delegate computerMakesMove:4];
            [delegate youLose];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [delegate computerMakesMove:5];
            [delegate youLose];
        }
    }
    
    else if (self.compHasCornersHumanHasCenter) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [delegate computerMakesMove:2];
            [delegate youLose];
        } else if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && ![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [delegate computerMakesMove:6];
            [delegate youLose];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [delegate youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [delegate youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [delegate youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
            }
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:8];
                [delegate youLose];
            } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
            }
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:8];
                [delegate youLose];
            }
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [delegate computerMakesMove:4];
            [delegate youLose];
        }
    }
}

- (void)fifthMove {
    if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
        [delegate computerMakesMove:2];
        [delegate catsTie];
    } else if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
        [delegate computerMakesMove:4];
        [delegate catsTie];
    } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
        [delegate computerMakesMove:6];
        [delegate catsTie];
    } else if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
        [delegate computerMakesMove:8];
        [delegate catsTie];
    }
}

@end
