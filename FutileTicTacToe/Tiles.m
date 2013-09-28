//
//  Tiles.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "Tiles.h"

@implementation Tiles

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (void)firstMove {
//    NSLog(@"first move called");
//    UIColor *xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
//    for (int index = 0; index < 8; index++) {
//        if (self.tag == index) {
//            self.backgroundColor = xBackground;
//        }
//    }
//}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touched %i", self.tag);
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o.png"]];
}

//- (void)computerMove:(int)tag {
//    UIColor *xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
