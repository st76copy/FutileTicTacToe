//
//  Tiles.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "Tiles.h"

@implementation Tiles

@synthesize selfView, computerMoves, delegate;

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"playingPiece"]) {
//            _tileImageName =@"o_tile.png";
//        }
//        else {
//            _tileImageName = @"x_tile.png";
//        }
//        computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
//        selfView = self;
//    }
//    return self;
//}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.backgroundColor != self.xBackground && self.backgroundColor != self.oBackground) {
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
            [delegate tileSelected:self];
        }];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
