//
//  Question.h
//  QuizTriviaGame
//
//  Created by Mark Bridges on 01/03/2014.
//  Copyright (c) 2014 George Francis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSString *questionItself;
@property NSString *category;
@property NSString *answer1;
@property NSString *answer2;
@property NSString *answer3;
@property NSString *answer4;
@property int correctAnswer;

@end
