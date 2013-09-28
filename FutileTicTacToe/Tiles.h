//
//  Tiles.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tiles : UIView

//  cannot seem to set an 'ivar' for background color this way;
//  @property (weak, nonatomic) UIColor *xBackground;
//  @property (weak, nonatomic) UIColor *oBackground;

- (void)firstMove;

@end
