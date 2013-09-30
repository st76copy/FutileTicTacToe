//
//  HumanMovesFirst.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "HumanMovesFirst.h"

@implementation HumanMovesFirst

@synthesize hasCenter, computerMoves, playerMoves, delegate;

- (void)initMutableArrays {
    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    playerMoves = [[NSMutableArray alloc] initWithCapacity:5];
}

- (void)resetAll {
    self.hasCenter = NO;
}

- (void)secondMove {
    if (![playerMoves containsObject:[NSNumber numberWithInt:5]]) {
        hasCenter = YES;
        [computerMoves addObject:[NSNumber numberWithInt:5]];
        [delegate computerMakesMove:5];
    }
}

- (void)thirdMove {
    if (hasCenter) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            [computerMoves addObject:[NSNumber numberWithInt:2]];
            [delegate computerMakesMove:2];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [delegate computerMakesMove:4];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [delegate computerMakesMove:8];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [delegate computerMakesMove:6];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            [delegate computerMakesMove:3];
        }  else if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            [computerMoves addObject:[NSNumber numberWithInt:1]];
            [delegate computerMakesMove:1];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [delegate computerMakesMove:7];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            [computerMoves addObject:[NSNumber numberWithInt:1]];
            [delegate computerMakesMove:1];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            [delegate computerMakesMove:9];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [delegate computerMakesMove:7];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            [delegate computerMakesMove:9];
        } else if ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            [delegate computerMakesMove:3];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:2]];
            [delegate computerMakesMove:2];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [delegate computerMakesMove:4];
        } else if (![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [delegate computerMakesMove:6];
        }
    }
}

- (void)fourthMove {
    
    [self checkIfBlockIsNeeded];
    
    //    if (hasCenter) {
    //        if (![playerMoves containsObject:[NSNumber numberWithInt:1]]) {
    //            if ([computerMoves containsObject:[NSNumber numberWithInt:5]] && [computerMoves containsObject:[NSNumber numberWithInt:9]]) {
    //                [delegate computerMakesMove:1];
    //                [delegate youLose];
    //            }
    //        }  else if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
    //            [computerMoves addObject:[NSNumber numberWithInt:<#(int)#>]];
    //            [delegate computerMakesMove:<#(int)#>];
    //        }
    //    }
}

- (void)fifthMove {
    [self checkIfBlockIsNeeded];
}

- (void)sixthMove {
    [self winCheck:YES];
}

- (void)checkIfBlockIsNeeded {
    NSLog(@"called CheckIfBlockIsNeeded");
    BOOL moveMade = NO;
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [computerMoves addObject:[NSNumber numberWithInt:2]];
                [delegate computerMakesMove:2];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [computerMoves addObject:[NSNumber numberWithInt:6]];
                [delegate computerMakesMove:6];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [computerMoves addObject:[NSNumber numberWithInt:4]];
                [delegate computerMakesMove:4];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [computerMoves addObject:[NSNumber numberWithInt:5]];
                [delegate computerMakesMove:5];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [computerMoves addObject:[NSNumber numberWithInt:1]];
                [delegate computerMakesMove:1];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [computerMoves addObject:[NSNumber numberWithInt:3]];
                [delegate computerMakesMove:3];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [computerMoves addObject:[NSNumber numberWithInt:9]];
                [delegate computerMakesMove:9];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [computerMoves addObject:[NSNumber numberWithInt:7]];
                [delegate computerMakesMove:7];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [computerMoves addObject:[NSNumber numberWithInt:8]];
                [delegate computerMakesMove:8];
                [self winCheck:NO];
                moveMade = YES;
            }
        }
    }
    if (!moveMade) {
        NSLog(@"from checkedForBlock to fillInAnySquare");
        [self fillInAnySquare];
    }
}


- (void)fillInAnySquare {
    NSLog(@"fillInAnySqare called");
    
    // BOOL implimented because else if statements were not funtioning as expected
    
    BOOL spaceFilled = NO;
    
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:1]] && ![computerMoves containsObject:[NSNumber numberWithInt:1]]) {
            [computerMoves addObject:[NSNumber numberWithInt:1]];
            [delegate computerMakesMove:1];
            spaceFilled = YES;
            [self winCheck:NO];
            
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:2]] && ![computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            [computerMoves addObject:[NSNumber numberWithInt:2]];
            [delegate computerMakesMove:2];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:3]] && ![computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            [computerMoves addObject:[NSNumber numberWithInt:3]];
            [delegate computerMakesMove:3];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:4]] && ![computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [computerMoves addObject:[NSNumber numberWithInt:4]];
            [delegate computerMakesMove:4];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:5]] && ![computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [computerMoves addObject:[NSNumber numberWithInt:5]];
            [delegate computerMakesMove:5];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:6]] && ![computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            [computerMoves addObject:[NSNumber numberWithInt:6]];
            [delegate computerMakesMove:6];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:7]] && ![computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            [computerMoves addObject:[NSNumber numberWithInt:7]];
            [delegate computerMakesMove:7];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:8]] && ![computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [computerMoves addObject:[NSNumber numberWithInt:8]];
            [delegate computerMakesMove:8];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
    if (!spaceFilled) {
        if (![playerMoves containsObject:[NSNumber numberWithInt:9]] && ![computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            [computerMoves addObject:[NSNumber numberWithInt:9]];
            [delegate computerMakesMove:9];
            spaceFilled = YES;
            [self winCheck:NO];
        }
    }
}



- (void)winCheck:(BOOL)finalRound {
    NSLog(@"winCheck called");
    BOOL gameOver = NO;
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate youLose];
                
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate youLose];
                
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:1]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate youLose];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:2]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                gameOver = YES;
                [delegate youLose];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate youLose];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:3]] && [computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate youLose];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:4]] && [computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate youLose];
            }
        }
    }
    if (!gameOver) {
        if ([computerMoves containsObject:[NSNumber numberWithInt:7]] && [computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate youLose];
            }
        }
    }
    if (!gameOver) {
        if (finalRound) {
            gameOver = YES;
            [delegate catsTie];
        }
    }
}

/*
 checkWin
 NSLog(@"checkIfBlockIsNeeded was called");
 
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
 [computerMoves addObject:[NSNumber numberWithInt:2]];
 [delegate computerMakesMove:2];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
 [computerMoves addObject:[NSNumber numberWithInt:4]];
 [delegate computerMakesMove:4];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:8]]) {
 [computerMoves addObject:[NSNumber numberWithInt:8]];
 [delegate computerMakesMove:8];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
 [computerMoves addObject:[NSNumber numberWithInt:6]];
 [delegate computerMakesMove:6];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
 [computerMoves addObject:[NSNumber numberWithInt:3]];
 [delegate computerMakesMove:3];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:2]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:1]]) {
 [computerMoves addObject:[NSNumber numberWithInt:1]];
 [delegate computerMakesMove:1];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if  ([playerMoves containsObject:[NSNumber numberWithInt:1]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
 [computerMoves addObject:[NSNumber numberWithInt:7]];
 [delegate computerMakesMove:7];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:4]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:1]]) {
 [computerMoves addObject:[NSNumber numberWithInt:1]];
 [delegate computerMakesMove:1];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:7]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 [computerMoves addObject:[NSNumber numberWithInt:9]];
 [delegate computerMakesMove:9];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if  ([playerMoves containsObject:[NSNumber numberWithInt:8]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
 [computerMoves addObject:[NSNumber numberWithInt:7]];
 [delegate computerMakesMove:7];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:3]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 [computerMoves addObject:[NSNumber numberWithInt:9]];
 [delegate computerMakesMove:9];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }
 if (!moveMade) {
 if  ([playerMoves containsObject:[NSNumber numberWithInt:6]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
 [computerMoves addObject:[NSNumber numberWithInt:3]];
 [delegate computerMakesMove:3];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 } if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:1]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 [computerMoves addObject:[NSNumber numberWithInt:9]];
 [delegate computerMakesMove:9];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:9]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:1]]) {
 [computerMoves addObject:[NSNumber numberWithInt:1]];
 [delegate computerMakesMove:1];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if  ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:2]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:8]]) {
 [computerMoves addObject:[NSNumber numberWithInt:8]];
 [delegate computerMakesMove:8];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:8]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:2]]) {
 [computerMoves addObject:[NSNumber numberWithInt:2]];
 [delegate computerMakesMove:2];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:3]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:7]]) {
 [computerMoves addObject:[NSNumber numberWithInt:7]];
 [delegate computerMakesMove:7];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:7]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:3]]) {
 [computerMoves addObject:[NSNumber numberWithInt:3]];
 [delegate computerMakesMove:3];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:4]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:6]]) {
 [computerMoves addObject:[NSNumber numberWithInt:6]];
 [delegate computerMakesMove:6];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 }  if (!moveMade) {
 if ([playerMoves containsObject:[NSNumber numberWithInt:5]] && [playerMoves containsObject:[NSNumber numberWithInt:6]]) {
 if (![playerMoves containsObject:[NSNumber numberWithInt:4]]) {
 [computerMoves addObject:[NSNumber numberWithInt:4]];
 [delegate computerMakesMove:4];
 [self winCheck:NO];
 moveMade = YES;
 }
 }
 } */

@end
