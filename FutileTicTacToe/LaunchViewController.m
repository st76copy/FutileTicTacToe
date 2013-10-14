//
//  LaunchViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/3/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "LaunchViewController.h"
#import "GamePlayViewController.h"
#import "ComputerMovesFirst.h"
#import "PlayerMovesFirst.h"

@interface LaunchViewController () {
    ComputerMovesFirst              *computerMovesFirst;
    PlayerMovesFirst                *playerMovesFirst;
    GamePlayViewController                  *viewController;
}

- (IBAction)playEasyGame:(id)sender;
- (IBAction)playNormalGame:(id)sender;

@end

@implementation LaunchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewController = [[GamePlayViewController alloc] init];
    computerMovesFirst = [[ComputerMovesFirst alloc] init];
    playerMovesFirst = [[PlayerMovesFirst alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[GamePlayViewController class]]) {
        viewController = segue.destinationViewController;
        if ([segue.identifier isEqualToString:@"normalMode"]) {
            viewController.normalDifficulty = YES;
        }
    }
}

- (IBAction)playEasyGame:(id)sender {
    [self performSegueWithIdentifier:@"easyMode" sender:self];
}

- (IBAction)playNormalGame:(id)sender {
    [self performSegueWithIdentifier:@"normalMode" sender:self];
}

@end
