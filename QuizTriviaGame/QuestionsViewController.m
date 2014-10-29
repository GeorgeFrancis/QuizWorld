//
//  QuestionsViewController.m
//  QuizTriviaGame
//
//  Created by George Francis on 01/03/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import "QuestionsViewController.h"

@interface QuestionsViewController ()

@end

@implementation QuestionsViewController

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
    [self setUpImages];
    
//    _answer1Button.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
 //   _answer2Button.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
 //   _answer3Button.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
 //   _answer4Button.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
 //   _QuestionText.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
  //  _highScoreLabel.transform = CGAffineTransformMakeRotation(-10 * M_PI / 180.0);
    
    
	// Do any additional setup after loading the view.
//    self.Result.hidden = YES;
//    self.Exit.hidden = YES;
//    self.NextCategory.hidden = YES;
}




- (void)setUpImages{
    self.correctAnswerImage = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.correctAnswerImage setImage:[UIImage imageNamed:@"correctBanner.png"]];
    [self.correctAnswerImage setAlpha:0];
    //[self.correctAnswerImage setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:self.correctAnswerImage];
    
    self.wrongAnswerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.wrongAnswerImage setImage:[UIImage imageNamed:@"wrongBanner.png"]];
    [self.wrongAnswerImage setAlpha:0];
    //[self.wrongAnswerImage setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.wrongAnswerImage];
    
    self.gameOverImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, -100, 320, 568)];
    [self.gameOverImage setImage:[UIImage imageNamed:@"gameOverBanner.png"]];
    [self.gameOverImage setAlpha:0];
    //[self.wrongAnswerImage setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.gameOverImage];
    
      
    
}




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.questionNumber = 0;
    [self updateScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)runTimer {
    
   _mainInt = 15;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

-(void)countDown {
    
    _mainInt -=1;
    _seconds.text = [NSString stringWithFormat:@"%i", _mainInt];
    if (_mainInt ==0 )
       
    {
        
        [self stopTimer];
        //[_timer invalidate];
        [self showWrongAnimation];
    }
   
}

-(void)stopTimer {
    
    [_timer invalidate];
}


- (void)loadInQuestion{
    
    
    self.currentQuestion = [[Game sharedInstance]nextQuestion];
    
    [self.QuestionText setText:self.currentQuestion.questionItself];
    [self.answer1Button setTitle:self.currentQuestion.answer1 forState:UIControlStateNormal];
    [self.answer2Button setTitle:self.currentQuestion.answer2 forState:UIControlStateNormal];
    [self.answer3Button setTitle:self.currentQuestion.answer3 forState:UIControlStateNormal];
    [self.answer4Button setTitle:self.currentQuestion.answer4 forState:UIControlStateNormal];
    
  //  [self countDown];
    [self runTimer];
       self.questionNumber++;
    
        
    }





- (void)updateScoreAndLives{
    [self.Score setText:[NSString stringWithFormat:@"%d",[[Game sharedInstance]ScoreNumber]]];
    [self.Lives setText:[NSString stringWithFormat:@"%d",[[Game sharedInstance]LivesNumber]]];
    [self.highScoreLabel setText:[NSString stringWithFormat:@"High Score: %d",[[Game sharedInstance]highScore]]];
}

- (IBAction)answerPressed:(id)sender{
    UIButton *pressedButton = (UIButton*)sender;
    if (self.currentQuestion.correctAnswer == pressedButton.tag) {
        [self answerCorrect];
        //[self countDown];
    }
    else{
        [self answerWrong];
        //[self countDown];
    }

}

- (void)answerCorrect{
    NSLog(@"Answer was correct");
    [[Game sharedInstance]addPoint];
    [self showCorrectAnimation];
    [self stopTimer];
}

- (void)answerWrong{
    NSLog(@"Answer was wrong");
    [[Game sharedInstance]loseLife];
    [self showWrongAnimation];
    [self stopTimer];
    

    
    }




- (void)updateScreen{
    [[Game sharedInstance]storeHighScore];
    [self loadInQuestion];
    [self updateScoreAndLives];
    [self checkForGameOver];
}

- (void)checkForGameOver{
    if ([Game sharedInstance].LivesNumber <= 0) {
        
        [_answer1Button setHidden:YES];
        [_answer2Button setHidden:YES];
        [_answer3Button setHidden:YES];
        [_answer4Button setHidden:YES];
        
        [_highScoreLabel setHidden:YES];
        [_Lives setHidden:YES];

        
        [_QuestionText setHidden:YES];
        
        [self showGameOverAnimation];
        
       // [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }
    
       else if (self.questionNumber > 3) {
           [self performSelector:@selector(popToCategoryView) withObject:nil afterDelay:1];
           [_QuestionText setHidden:YES];
           [_answer1Button setHidden:YES];
           [_answer2Button setHidden:YES];
           [_answer3Button setHidden:YES];
           [_answer4Button setHidden:YES];

           
           
          // [self showThreeCorrectAnimation];
       }
  
}

- (void)popToCategoryView{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}



- (void)showCorrectAnimation{
    

    [UIView animateWithDuration:0.1
                     animations:^{
                         [self.correctAnswerImage setAlpha:1];
                        // [self.correctAnswerImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.correctAnswerImage.frame.size.height)];
                     } completion:^(BOOL finished) {
                         [self updateScreen];
                         [UIView animateWithDuration:2.0
                                          animations:^{
                                            [self.correctAnswerImage setAlpha:0];

                                   //           [self.correctAnswerImage setFrame:CGRectMake(0, 0, 0, self.correctAnswerImage.frame.size.height)];
                                         }];
                         
                        

                     }];
}





- (void)showWrongAnimation{
    [UIView animateWithDuration:0.1
                     animations:^{
                         [self.wrongAnswerImage setAlpha:1];
    //                     [self.wrongAnswerImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.wrongAnswerImage.frame.size.height)];
                     } completion:^(BOOL finished) {
                         [self updateScreen];
                         [UIView animateWithDuration:2.0
                                          animations:^{
                                              [self.wrongAnswerImage setAlpha:0];
       //                                       [self.wrongAnswerImage setFrame:CGRectMake(0, 0, 0, self.wrongAnswerImage.frame.size.height)];
                                          }];
                     }];
}

- (void)showGameOverAnimation{
    [UIView animateWithDuration:2.0
                     animations:^{
                         [self.gameOverImage setAlpha:1];
                         // [self.correctAnswerImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.correctAnswerImage.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                          [self.navigationController popToRootViewControllerAnimated:YES];
                                              }];
}







@end
