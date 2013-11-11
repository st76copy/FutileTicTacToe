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
    ComputerMovesFirst                      *computerMovesFirst;
    PlayerMovesFirst                        *playerMovesFirst;
    GamePlayViewController                  *viewController;
    UIImage                                 *backgroundImage;
    __weak IBOutlet UIView                  *launchView;
    __weak IBOutlet UIView                  *gameTypeView;
}
- (IBAction)playGame:(id)sender;
- (IBAction)goToSettings:(id)sender;
- (IBAction)onePlayerGame:(id)sender;
- (IBAction)twoPlayerGame:(id)sender;
- (IBAction)playEasyGame:(id)sender;
- (IBAction)playNormalGame:(id)sender;

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    viewController = [[GamePlayViewController alloc] init];
    computerMovesFirst = [[ComputerMovesFirst alloc] init];
    playerMovesFirst = [[PlayerMovesFirst alloc] init];
    
    backgroundImage = [UIImage imageNamed:@"Aqua.png"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    launchView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    gameTypeView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"playingPiece"]) {
        [[NSUserDefaults standardUserDefaults] setBool:1 forKey:@"playingPiece"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [launchView setHidden:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[GamePlayViewController class]]) {
        viewController = segue.destinationViewController;
        if ([segue.identifier isEqualToString:@"normalMode"]) {
            viewController.normalDifficulty = YES;
        }
    }
}

- (IBAction)playGame:(id)sender {
    [launchView setHidden:YES];
}

- (IBAction)goToSettings:(id)sender {
    [self performSegueWithIdentifier:@"settingsModal" sender:self];
}

- (IBAction)onePlayerGame:(id)sender {
}

- (IBAction)twoPlayerGame:(id)sender {
}

- (IBAction)playEasyGame:(id)sender {
    [self performSegueWithIdentifier:@"easyMode" sender:self];
}

- (IBAction)playNormalGame:(id)sender {
    [self performSegueWithIdentifier:@"normalMode" sender:self];
}

@end
