//
//  ComputerFirstMove.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TilesDelegate.h"

@interface ComputerMovesFirst : NSObject

@property (strong, nonatomic) id <TilesDelegate> delegate;

@property (assign, nonatomic) int randomizer;
@property (assign, nonatomic) BOOL compHasCornersNoHumanCenter;
@property (assign, nonatomic) BOOL compHasCornersHumanHasCenter;
@property (assign, nonatomic) BOOL compDoesNotHaveBothGoldenCorners;
@property (assign, nonatomic) BOOL compHasAllThreeCorners;
@property (assign, nonatomic) BOOL finalMove;
@property (retain, nonatomic) NSMutableArray *computerMoves;
@property (retain, nonatomic) NSMutableArray *playerMoves;

- (void)initMutableArrays;
- (void)firstMove:(BOOL)normalPlay;
- (void)secondMove:(BOOL)normalPlay;
- (void)thirdMove:(BOOL)normalPlay;
- (void)fourthMove:(BOOL)normalPlay;
- (void)fifthMove:(BOOL)normalPlay;
- (void)winCheck;

@end