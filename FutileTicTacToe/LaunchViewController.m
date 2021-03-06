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
    GamePlayViewController                  *gamePlayViewController;
    UIImage                                 *backgroundImage;
    __weak IBOutlet UIView                  *launchView;
    __weak IBOutlet UIView                  *gameTypeView;
    __weak IBOutlet UIView                  *gameDifficultyView;
    
}

- (IBAction)legalButtonPressed:(id)sender;
- (IBAction)playGame:(id)sender;
- (IBAction)goToSettings:(id)sender;
- (IBAction)onePlayerGame:(id)sender;
- (IBAction)twoPlayerGame:(id)sender;
- (IBAction)playEasyGame:(id)sender;
- (IBAction)playNormalGame:(id)sender;
- (IBAction)playImpossibleGame:(id)sender;
- (IBAction)goBackToPlayers:(id)sender;
- (IBAction)goBackToLaunchMenu:(id)sender;

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    gamePlayViewController = [[GamePlayViewController alloc] init];
    computerMovesFirst = [[ComputerMovesFirst alloc] init];
    playerMovesFirst = [[PlayerMovesFirst alloc] init];
    
    backgroundImage = [UIImage imageNamed:@"Aqua.png"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    launchView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    gameTypeView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    gameDifficultyView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"playingPiece"]) {
        [[NSUserDefaults standardUserDefaults] setBool:1 forKey:@"playingPiece"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [launchView setHidden:NO];
    [gameTypeView setHidden:YES];
    [gameDifficultyView setHidden:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[GamePlayViewController class]]) {
        gamePlayViewController = segue.destinationViewController;
        if ([segue.identifier isEqualToString:@"easyMode"]) {
            gamePlayViewController.normalDifficulty = NO;
            gamePlayViewController.impossibleDifficulty = NO;
        } else if ([segue.identifier isEqualToString:@"normalMode"]) {
            gamePlayViewController.normalDifficulty = YES;
            gamePlayViewController.impossibleDifficulty = NO;
        } else if ([segue.identifier isEqualToString:@"impossibleMode"]) {
            gamePlayViewController.normalDifficulty = NO;
            gamePlayViewController.impossibleDifficulty = YES;
        }
    }
}

- (IBAction)legalButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"terms" sender:self];
}

- (IBAction)playGame:(id)sender {
    [launchView setHidden:YES];
    [gameTypeView setHidden:NO];
}

- (IBAction)goToSettings:(id)sender {
    [self performSegueWithIdentifier:@"settingsModal" sender:self];
}

- (IBAction)onePlayerGame:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:1 forKey:@"singlePlayerGame"];
    [gameTypeView setHidden:YES];
    [gameDifficultyView setHidden:NO];
}

- (IBAction)twoPlayerGame:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:0 forKey:@"singlePlayerGame"];
    [self performSegueWithIdentifier:@"twoPlayerMode" sender:self];
}

- (IBAction)playEasyGame:(id)sender {
    [self performSegueWithIdentifier:@"easyMode" sender:self];
}

- (IBAction)playNormalGame:(id)sender {
    [self performSegueWithIdentifier:@"normalMode" sender:self];
}

- (IBAction)playImpossibleGame:(id)sender {
    [self performSegueWithIdentifier:@"impossibleMode" sender:self];
}

- (IBAction)goBackToPlayers:(id)sender {
    [gameDifficultyView setHidden:YES];
    [gameTypeView setHidden:NO];
}

- (IBAction)goBackToLaunchMenu:(id)sender {
    [gameTypeView setHidden:YES];
    [launchView setHidden:NO];
}

@end