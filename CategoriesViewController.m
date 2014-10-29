//
//  Categories.m
//  QuizTriviaGame
//
//  Created by George Francis on 17/02/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import "CategoriesViewController.h"

@interface CategoriesViewController ()

@end

@implementation CategoriesViewController



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
 //   _Category1.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
  //  _Category2.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
 //   _Category3.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
 //   _Category4.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)categorySelected:(id)sender{
    UIButton *pressedButton = (UIButton*)sender;
    [Game sharedInstance].selectedCategory = pressedButton.titleLabel.text;
}





@end
