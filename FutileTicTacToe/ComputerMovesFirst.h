//
//  ComputerFirstMove.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/29/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardAutomatedMove.h"
#import "TilesDelegate.h"

@interface ComputerMovesFirst : NSObject

@property (strong, nonatomic) id <TilesDelegate> delegate;

@property (nonatomic) int randomizer;
@property (nonatomic) BOOL compHasCornersNoHumanCenter;
@property (nonatomic) BOOL compHasCornersHumanHasCenter;
@property (nonatomic) BOOL compDoesNotHaveBothGoldenCorners;
@property (nonatomic) BOOL compHasAllThreeCorners;
//@property (nonatomic) BOOL finalMove;
//@property (nonatomic) NSMutableArray *computerMoves;
//@property (nonatomic) NSMutableArray *playerMoves;
@property (nonatomic) StandardAutomatedMove *standardAutomatedMove;
@property (nonatomic) Tiles *tiles;

//- (void)initMutableArrays;
- (void)firstMove:(BOOL)normalPlay;
- (void)secondMove:(BOOL)normalPlay;
- (void)thirdMove:(BOOL)normalPlay;
- (void)fourthMove:(BOOL)normalPlay;
- (void)fifthMove:(BOOL)normalPlay;
//- (void)winCheck;

@end
