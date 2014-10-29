//
//  QuestionsViewController.h
//  QuizTriviaGame
//
//  Created by George Francis on 01/03/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "MasterViewController.h"

@interface QuestionsViewController : MasterViewController <ADBannerViewDelegate>

//@property IBOutlet UILabel *CategorySelected;
@property IBOutlet UILabel *QuestionText;
@property IBOutlet UIButton *answer1Button;
@property IBOutlet UIButton *answer2Button;
@property IBOutlet UIButton *answer3Button;
@property IBOutlet UIButton *answer4Button;
//@property IBOutlet UIButton *NextCategory;
//@property IBOutlet UIButton *Exit;
@property IBOutlet UILabel *Score;
@property IBOutlet UILabel *Lives;
@property IBOutlet UIImageView *Result;
//@property IBOutlet UILabel *showCategory;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;

@property int questionNumber;

@property UIImageView *correctAnswerImage;
@property UIImageView *wrongAnswerImage;

@property UIImageView *gameOverImage;


@property int mainInt;
@property NSTimer *timer;
@property IBOutlet UILabel *seconds;



@property Question *currentQuestion;

- (IBAction)answerPressed:(id)sender;
//- (IBAction)displayCategory:(id)sender;

@end
