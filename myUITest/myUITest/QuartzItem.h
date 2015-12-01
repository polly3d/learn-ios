//
//  QuartzItem.h
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuartzItem : NSObject

@property (nonatomic,copy) NSString *itemName;
@property (nonatomic,copy) NSString *itemClassName;


- (instancetype)initWithItemName:(NSString *)name className:(NSString *)className;

@end
