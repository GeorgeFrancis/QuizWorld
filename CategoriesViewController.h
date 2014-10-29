//
//  Categories.h
//  QuizTriviaGame
//
//  Created by George Francis on 17/02/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import <iAd/iAd.h>
#import "MasterViewController.h"


@interface CategoriesViewController : MasterViewController <ADBannerViewDelegate>

@property IBOutlet UIButton *Category1;
@property IBOutlet UIButton *Category2;
@property IBOutlet UIButton *Category3;
@property IBOutlet UIButton *Category4;
@property IBOutlet UILabel *Score;
@property IBOutlet UILabel *Lives;

-(IBAction)categorySelected:(id)sender;

@end

