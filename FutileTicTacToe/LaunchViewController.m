//
//  LaunchViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 10/3/13.
//  Copyright (c) 2013 Jeremy Herrero. All rights reserved.
//

#import "LaunchViewController.h"
#import "ViewController.h"
#import "ComputerMovesFirst.h"
#import "PlayerMovesFirst.h"

@interface LaunchViewController () {
    ComputerMovesFirst              *computerMovesFirst;
    PlayerMovesFirst                *playerMovesFirst;
    ViewController                  *viewController;
}

- (IBAction)startGame:(id)sender;

@end

@implementation LaunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewController = [[ViewController alloc] init];
    computerMovesFirst = [[ComputerMovesFirst alloc] init];
    playerMovesFirst = [[PlayerMovesFirst alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(id)sender {
    [self performSegueWithIdentifier:@"playGame" sender:self];
}
@end
