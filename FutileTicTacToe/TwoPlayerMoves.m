//
//  TwoPlayerMoves.m
//  Futile TTT
//
//  Created by Jeremy Herrero on 11/11/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "TwoPlayerMoves.h"

@implementation TwoPlayerMoves

@synthesize delegate;

- (void)initMutableArrays {
    _playerOneMoves = [[NSMutableArray alloc] initWithCapacity:5];
    _playerTwoMoves = [[NSMutableArray alloc] initWithCapacity:5];
}

- (void)winCheck:(BOOL)finalMove {
    BOOL gameOver = NO;
    for (int arbitrary = 0; arbitrary < 1; arbitrary++) {
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:1]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:1]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:1]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:2]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:8]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:3]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:3]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:4]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerOneMoves containsObject:[NSNumber numberWithInt:7]] && [_playerOneMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([_playerOneMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [self performSelector:@selector(firstPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:1]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:2]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:3]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:1]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:4]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:1]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:2]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:8]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:3]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:6]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:3]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:7]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:4]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:5]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:6]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
                break;
            }
        }
        if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:7]] && [_playerTwoMoves containsObject:[NSNumber numberWithInt:8]]) {
            if ([_playerTwoMoves containsObject:[NSNumber numberWithInt:9]]) {
                gameOver = YES;
                [self performSelector:@selector(secondPlayerWon) withObject:nil afterDelay:0.7];
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

- (void)firstPlayerWon {
    [delegate playerOneWon:YES];
}

- (void)secondPlayerWon {
    [delegate playerOneWon:NO];
}

- (void)catsTie {
    [delegate catsTie];
}

@end