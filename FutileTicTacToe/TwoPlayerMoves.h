//
//  TwoPlayerMoves.h
//  Futile TTT
//
//  Created by Jeremy Herrero on 11/11/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TilesDelegate.h"

@interface TwoPlayerMoves : NSObject

@property (strong, nonatomic) id <TilesDelegate> delegate;

@property (retain, nonatomic) NSMutableArray *playerOneMoves;
@property (retain, nonatomic) NSMutableArray *playerTwoMoves;

- (void)initMutableArrays;
- (void)winCheck:(BOOL)finalMove;

@end