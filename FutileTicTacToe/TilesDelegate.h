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

- (void)tileUserInteraction:(BOOL)enable;
- (void)computerMakesMove:(int)tagNumber;
- (void)tileSelected:(Tiles *)tiles;
- (void)playerWon;
- (void)playerLost;
- (void)catsTie;

@end
