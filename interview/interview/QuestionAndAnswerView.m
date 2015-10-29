//
//  QuestionAndAnswerView.m
//  interview
//
//  Created by wang on 15/10/28.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "QuestionAndAnswerView.h"
#import "AnswerStartView.h"

@implementation QuestionAndAnswerView

- (void)initWithQuestionItem:(QuestionItem *)item
{
    UILabel *label = [[UILabel alloc] init];
    label.text = item.question;
    label.frame = CGRectMake(0, 0, 300, 50);
    [self addSubview:label];
    
    for (int i = 0; i < 4; i++) {
        AnswerStartView *answerStar = [AnswerStartView initWith:i + 1];
        [self addSubview:answerStar];
    }
    
}

+ (id)initWithQuestionItem:(QuestionItem *)item
{
    QuestionAndAnswerView *view = [[QuestionAndAnswerView alloc] init];
    [view initWithQuestionItem:item];
    return view;
}

@end
