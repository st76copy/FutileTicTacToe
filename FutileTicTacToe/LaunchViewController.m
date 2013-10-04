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

- (IBAction)easyPlay:(id)sender;
- (IBAction)normalPlay:(id)sender;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    viewController = segue.destinationViewController;
//    if ([segue.identifier isEqualToString:@"startGame"]) {
//    }
//    detailsViewController.feedTitle = [feedTitlesArray objectAtIndex:selectedRow];
}

- (IBAction)easyPlay:(id)sender {
    [viewController setNormalDifficulty:NO];
//    computerMovesFirst.normalDifficulty = NO;
//    playerMovesFirst.normalDifficulty = NO;
//    [viewController setNormalDifficulty:NO];
    [self performSegueWithIdentifier:@"startGame" sender:self];
}

- (IBAction)normalPlay:(id)sender {
    [viewController setNormalDifficulty:YES];
//    computerMovesFirst.normalDifficulty = YES;
//    playerMovesFirst.normalDifficulty = YES;
//    [computerMovesFirst initDifficulty:YES];
//    [viewController setNormalDifficulty:YES];
    [self performSegueWithIdentifier:@"startGame" sender:self];
}
@end
