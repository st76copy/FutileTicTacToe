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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
        self.oBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o.png"]];
        computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
        selfView = self;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.backgroundColor != self.xBackground && self.backgroundColor != self.oBackground) {
        [delegate tileUserInteraction:NO];
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o.png"]];
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
