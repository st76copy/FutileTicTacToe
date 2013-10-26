//
//  PlayerMovesFirst.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/1/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardAutomatedMove.h"
#import "TilesDelegate.h"

@interface PlayerMovesFirst : NSObject

@property (strong, nonatomic) id <TilesDelegate> delegate;

//@property (nonatomic) BOOL finalMove;
@property (nonatomic) int randomizer;
//@property (nonatomic) NSMutableArray *computerMoves;
//@property (nonatomic) NSMutableArray *playerMoves;
@property (nonatomic) StandardAutomatedMove *standardAutomatedMove;
@property (nonatomic) Tiles *tiles;

//- (void)initMutableArrays;
- (void)firstMove:(BOOL)normalPlay;
- (void)secondMove:(BOOL)normalPlay;
- (void)thirdMove:(BOOL)normalPlay;
- (void)fourthMove:(BOOL)normalPlay;
- (void)fifthMove;
//- (void)winCheck;

@end
