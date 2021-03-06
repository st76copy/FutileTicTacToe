//
//  ViewController.h
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "TilesDelegate.h"

@interface GamePlayViewController : UIViewController <TilesDelegate, ADBannerViewDelegate>

@property (nonatomic) BOOL computerIsFirst;
@property (nonatomic) BOOL normalDifficulty;
@property (nonatomic) BOOL impossibleDifficulty;
@property (nonatomic) BOOL gameEnded;
//@property (nonatomic) BOOL singlePlayerGame;
@property (nonatomic) int moveCount;
@property (nonatomic) int winCount;
@property (nonatomic) int loseCount;
@property (nonatomic) int roundsCounter;

@end