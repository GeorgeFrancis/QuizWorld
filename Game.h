//
//  Game.h
//  QuizTriviaGame
//
//  Created by George Francis on 17/02/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface Game : NSObject

@property NSString *selectedCategory;
@property int ScoreNumber;
@property int LivesNumber;




@property NSMutableArray *allQuestions;

+(Game*)sharedInstance;

- (void)startNewGame;
- (Question*)nextQuestion;
- (void)loseLife;
- (void)addPoint;

- (void)storeHighScore;
- (int)highScore;


@end
