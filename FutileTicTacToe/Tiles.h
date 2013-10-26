//
//  Tiles.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TilesDelegate.h"

@interface Tiles : UIView

@property (strong, nonatomic) id <TilesDelegate> delegate;

@property (weak, nonatomic) UIColor *xBackground;
@property (weak, nonatomic) UIColor *oBackground;
@property (strong, nonatomic) UIView *selfView;
@property (nonatomic) NSMutableArray *computerMoves;
@property (nonatomic) NSMutableArray *playerMoves;

@end
