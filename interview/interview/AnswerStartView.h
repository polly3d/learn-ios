//
//  AnswerStartView.h
//  interview
//
//  Created by wang on 15/10/28.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerStartView : UIView

@property (nonatomic) int star;

- (void)initWith:(int)star;

+ (id)initWith:(int)star;
@end
