//
//  Game.m
//  QuizTriviaGame
//
//  Created by George Francis on 17/02/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

@synthesize ScoreNumber, LivesNumber;

+(Game*)sharedInstance {
    static Game *sharedInstance;
    @synchronized(self) {
        if(!sharedInstance){
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self LoadQuestions];
    }
    return self;
}

- (void)LoadQuestions{
    
    self.allQuestions = [[NSMutableArray alloc]init];
    
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSArray *plistQuestions = [[NSArray alloc] initWithContentsOfFile:sourcePath];
    
    for (NSDictionary *aDic in plistQuestions) {
        Question *aQuestion = [[Question alloc]init];
        aQuestion.questionItself = [aDic objectForKey:@"questionItself"];
        aQuestion.category = [aDic objectForKey:@"category"];
        aQuestion.answer1 = [aDic objectForKey:@"answer1"];
        aQuestion.answer2 = [aDic objectForKey:@"answer2"];
        aQuestion.answer3 = [aDic objectForKey:@"answer3"];
        aQuestion.answer4 = [aDic objectForKey:@"answer4"];
        aQuestion.correctAnswer = [[aDic objectForKey:@"correctAnswer"]intValue];
        
        [self.allQuestions addObject:aQuestion];
    }
    
}

- (void)startNewGame{
    LivesNumber = 3;
    ScoreNumber = 0;
}

- (NSArray*)selectedCategoriesQuestions{
    NSMutableArray *selectedCategoriesQuestions = [[NSMutableArray alloc]init];
    
    for (Question *aQuestion in self.allQuestions){
        if ([aQuestion.category isEqualToString:self.selectedCategory]) {
            [selectedCategoriesQuestions addObject:aQuestion];
        }
    }
    return [NSArray arrayWithArray:selectedCategoriesQuestions];
}

- (Question*)nextQuestion{
    NSArray *questionsInSelectedCat = [self selectedCategoriesQuestions];
    int r = arc4random() % [questionsInSelectedCat count];
    
    return [questionsInSelectedCat objectAtIndex:r];
}

- (void)loseLife{
    LivesNumber = LivesNumber - 1;
}

- (void)addPoint{
    ScoreNumber = ScoreNumber + 1;
}

- (void)storeHighScore{
    int currentHighScore = (int)[[NSUserDefaults standardUserDefaults]integerForKey:@"highScore"];
    if (currentHighScore < ScoreNumber) {
        
        [[NSUserDefaults standardUserDefaults]setInteger:ScoreNumber forKey:@"highScore"];
    }
}

- (int)highScore{
    return (int)[[NSUserDefaults standardUserDefaults]integerForKey:@"highScore"];
}


@end
