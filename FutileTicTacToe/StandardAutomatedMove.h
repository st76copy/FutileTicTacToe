//
//  StandardAutomatedMove.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/26/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tiles.h"
#import "TilesDelegate.h"

@interface StandardAutomatedMove : NSObject

@property (nonatomic) id <TilesDelegate> delegate;

@property (nonatomic) BOOL finalMove;
@property (nonatomic) NSMutableArray *computerMoves;
@property (nonatomic) NSMutableArray *playerMoves;
@property (nonatomic) Tiles *tiles;

- (void)attempWinningMove;
- (void)checkIfBlockIsNeeded;
- (void)fillInAnySquare;
- (void)winCheck;
- (void)catsTie;

@end
