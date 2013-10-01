//
//  ViewController.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TilesDelegate.h"

@interface ViewController : UIViewController <TilesDelegate>

@property (assign, nonatomic) BOOL wonTimerStarted;
@property (assign, nonatomic) BOOL computerIsFirst;
@property (assign, nonatomic) int moveCount;
@property (assign, nonatomic) int loseCount;
@property (assign, nonatomic) int count;

@end
