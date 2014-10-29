//
//  ViewController.h
//  QuizTriviaGame
//
//  Created by George Francis on 17/02/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import <iAd/iAd.h>
#import "MasterViewController.h"

@interface StartMenuViewController : MasterViewController

@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;

- (IBAction)startPressed:(id)sender;

@end
