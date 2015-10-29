//
//  QuestionAndAnswerView.h
//  interview
//
//  Created by wang on 15/10/28.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"

@interface QuestionAndAnswerView : UIView

@property (nonatomic,strong) NSArray *answerArr;

@property (nonatomic,strong) QuestionItem *item;

@property (nonatomic) int userAnswer;

- (void)initWithQuestionItem:(QuestionItem *)item;

+ (id)initWithQuestionItem:(QuestionItem *)item;

@end
