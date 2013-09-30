//
//  HumanMovesFirst.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TilesDelegate.h"

@interface HumanMovesFirst : NSObject

@property (strong, nonatomic) id <TilesDelegate> delegate;

@property (assign, nonatomic) BOOL hasCenter;
@property (retain, nonatomic) NSMutableArray *computerMoves;
@property (retain, nonatomic) NSMutableArray *playerMoves;

- (void)initMutableArrays;
- (void)secondMove;
- (void)thirdMove;
- (void)fourthMove;
- (void)fifthMove;

@end
