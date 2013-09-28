//
//  ViewController.m
//  FutileTicTacToe
//
//  Created by Jeremy Herrero on 9/27/13.
//  Copyright (c) 2s13 Jeremy Herrero. All rights reserved.
//

#import "ViewController.h"
#import "Tiles.h"

// I learned to create outlets here rather than in the header file because it keeps them private
@interface ViewController () {
    
    //    Tiles                           *tiles;
    UIColor                         *xBackground;
    NSMutableArray                  *computerMoves;
    NSMutableArray                  *playerMoves;
    __weak IBOutlet UILabel         *winsLabel;
    __weak IBOutlet UILabel         *lossesLabel;
    __weak IBOutlet UIImageView     *boardImageView;
}
- (IBAction)startGameButton:(id)sender;
- (IBAction)resetGameButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    playerMoves = [[NSMutableArray alloc] initWithCapacity:4];
    computerMoves = [[NSMutableArray alloc] initWithCapacity:5];
    xBackground = [UIColor colorWithPatternImage:[UIImage imageNamed:@"x.png"]];
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[Tiles class]]) {
            Tiles *tiles = (Tiles *)subview;
            tiles.delegate = self;
        }
    }
    
    boardImageView.image = [UIImage imageNamed:@"board.png"];
}

- (void)firstMove {
    
    for (UIView *firstTile in self.view.subviews) {
        if (firstTile.tag == 1) {
            firstTile.backgroundColor = xBackground;
            [firstTile setUserInteractionEnabled:NO];
            [computerMoves addObject:[NSNumber numberWithInteger:1]];
        }
    }
}

- (void)nextMove {
    if (playerMoves.count == 1) {
        if (![playerMoves containsObject:[NSNumber numberWithInteger:5]] && ![playerMoves containsObject:[NSNumber numberWithBool:9]]) {
            if (playerMoves.count == 1) {
                if ([playerMoves containsObject:[NSNumber numberWithInteger:2]] || [playerMoves containsObject:[NSNumber numberWithInteger:4]]) {
                    [self computerMakesMove:9];
                }
            } else {
                //        tag 9
            }
        }
    }
    
    
    
    else if (playerMoves.count == 2) {
        
    }
    
    
    
    else if (playerMoves.count == 3) {
        
    }
    
    
    
    else if (playerMoves.count == 4) {
        
    }
}

- (void)computerMakesMove:(int)tagNumber {
    for (UIView *tileMove in self.view.subviews) {
        if (tileMove.tag == tagNumber) {
            tileMove.backgroundColor = xBackground;
            [tileMove setUserInteractionEnabled:NO];
            [computerMoves addObject:[NSNumber numberWithInt:tagNumber]];
        }
    }
}

#pragma mark TilesDelegate
- (void)tileSelected:(Tiles *)tiles {
    [playerMoves addObject:[NSNumber numberWithInteger:tiles.tag]];
    [self nextMove];
}

- (IBAction)startGameButton:(id)sender {
    for (UIView *tile in self.view.subviews) {
        [tile setUserInteractionEnabled:YES];
    }
    [self firstMove];
}

- (IBAction)resetGameButton:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
