//
//  PlayerMovesFirst.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/1/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TilesDelegate.h"

@interface PlayerMovesFirst : NSObject

@property (strong, nonatomic) id <TilesDelegate> delegate;

@property (assign, nonatomic) BOOL normalDifficulty;
@property (retain, nonatomic) NSMutableArray *computerMoves;
@property (retain, nonatomic) NSMutableArray *playerMoves;

- (void)initMutableArrays;
- (void)firstMove;
- (void)secondMove;
- (void)thirdMove;
- (void)fourthMove;
- (void)fifthMove;

@end
