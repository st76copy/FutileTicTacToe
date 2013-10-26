//
//  tiles.playerMovesFirst.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/1/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "PlayerMovesFirst.h"

@implementation PlayerMovesFirst

@synthesize standardAutomatedMove, tiles, randomizer, delegate;

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
        if (![tiles.playerMoves containsObject:[NSNumber numberWithInt:5]]) {
            [delegate computerMakesMove:5];
        } else {
            int move = arc4random() % 7 + 1;
            if (move % 2 != 0) {
                move++;
            }
            [delegate computerMakesMove:move];
        }
    } else {
        if (![tiles.computerMoves containsObject:[NSNumber numberWithInt:4]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:4]]) {
            [delegate computerMakesMove:4];
        } else if (![tiles.computerMoves containsObject:[NSNumber numberWithInt:8]] && ![tiles.playerMoves containsObject:[NSNumber numberWithInt:8]]) {
            [delegate computerMakesMove:8];
        }
    }
}


- (void)secondMove:(BOOL)normalPlay {
    if (normalPlay) {
        [standardAutomatedMove attempWinningMove];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)thirdMove:(BOOL)normalPlay {
    if (normalPlay) {
        [standardAutomatedMove attempWinningMove];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fourthMove:(BOOL)normalPlay {
    if (normalPlay) {
        [standardAutomatedMove attempWinningMove];
    } else {
        [self easyPlayRandomizedMove];
    }
}

- (void)fifthMove {
    standardAutomatedMove.finalMove = YES;
    [standardAutomatedMove winCheck];
}

@end
