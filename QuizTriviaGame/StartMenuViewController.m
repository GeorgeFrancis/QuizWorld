//
//  ViewController.m
//  QuizTriviaGame
//
//  Created by George Francis on 17/02/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import "StartMenuViewController.h"

@interface StartMenuViewController ()

@end

@implementation StartMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.highScoreLabel setText:[NSString stringWithFormat:@"High Score: %d",[[Game sharedInstance]highScore]]];
}

- (IBAction)startPressed:(id)sender{
    [[Game sharedInstance]startNewGame];
}

@end
