//
//  SettingsViewController.m
//  Futile TTT
//
//  Created by Jeremy Herrero on 11/9/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController {
    
    __weak IBOutlet UIView *xView;
    __weak IBOutlet UIView *oView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Aqua.png"]];
    xView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x_tile.png"]];
    oView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"o_tile.png"]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == xView) {
        [[NSUserDefaults standardUserDefaults] setBool:0 forKey:@"playingPiece"];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if ([touch view] == oView) {
        [[NSUserDefaults standardUserDefaults] setBool:1 forKey:@"playingPiece"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end