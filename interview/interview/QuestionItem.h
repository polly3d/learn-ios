//
//  QuestionItem.h
//  interview
//
//  Created by wang on 15/10/28.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionItem : NSObject

@property (nonatomic,strong) NSString *question;

- (id)initWithQuestion:(NSString *)question;

@end
