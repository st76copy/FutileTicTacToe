//
//  TilesDelegate.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/28/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tiles;

@protocol TilesDelegate <NSObject>

- (void)computerMakesMove:(int)tagNumber;
- (void)tileSelected:(Tiles *)tiles;
- (void)youLose;
- (void)catsTie;

@end
