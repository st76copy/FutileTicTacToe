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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
        self.oBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o.png"]];
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.backgroundColor != self.xBackground) {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o.png"]];
    [delegate tileSelected:self];
    }
}

- (void)computerMove:(int)tag {
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
