//
//  Tiles.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "Tiles.h"

@implementation Tiles

@synthesize delegate;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.backgroundColor == [UIColor clearColor]) {
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
            [delegate tileUserInteraction:NO];
            self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
            if (![[NSUserDefaults standardUserDefaults] boolForKey:@"playingPiece"]) {
                self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x_tile.png"]];
            } else {
                self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o_tile.png"]];
            }
            [self setUserInteractionEnabled:NO];
            [UIView animateWithDuration:0.7 animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [delegate tileUserInteraction:YES];
                [delegate singlePlayerTileSelected:self];
            }];
        } else if (![[NSUserDefaults standardUserDefaults] boolForKey:@"singlePlayerGame"]) {
            [delegate twoPlayerTileSelected:self];
        }
    }
}

@end