//
//  ViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "ViewController.h"

// I learned to create outlets here rather than in the header file because it keeps them private
@interface ViewController () {
    
    __weak IBOutlet UILabel *winsLabel;
    __weak IBOutlet UILabel *lossesLabel;
    __weak IBOutlet UIImageView *boardImageView;
}
- (IBAction)startGameButton:(id)sender;
- (IBAction)resetGameButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    boardImageView.image = [UIImage imageNamed:@"board.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGameButton:(id)sender {
}

- (IBAction)resetGameButton:(id)sender {
}
@end
