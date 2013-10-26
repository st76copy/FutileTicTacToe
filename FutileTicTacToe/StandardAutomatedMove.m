//
//  StandardAutomatedMove.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/26/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "StandardAutomatedMove.h"

@implementation StandardAutomatedMove

@synthesize tiles, finalMove, delegate;

- (void)attempWinningMove {
    for (int arbitrary = 0; arbitrary < 1; arbitrary++) {
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:6]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:5]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:8]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:5]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                [self winCheck];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:5]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
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
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:2]]) {
                [delegate computerMakesMove:2];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:3]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                [self winCheck];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
                [delegate computerMakesMove:5];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
            if (![tiles.computerMoves containsObject:[NSNumber numberWithInt:4]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
                [delegate computerMakesMove:4];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                [delegate computerMakesMove:6];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                [delegate computerMakesMove:9];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:8]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                [delegate computerMakesMove:8];
                break;
            }
        }
        
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                [delegate computerMakesMove:3];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:1]]) {
                [delegate computerMakesMove:1];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                [delegate computerMakesMove:7];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:6]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:9]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
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
        if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:tileInt]] && ![tiles.computerMoves containsObject:[NSNumber numberWithInt:tileInt]]) {
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
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:2]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.computerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([tiles.computerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerLost];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:1]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:3]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:4]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [delegate playerWon];
                break;
            }
        }
        if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:7]] && [tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([tiles.playerMoves containsObject:[NSNumber numberWithInt:9]]) {
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
