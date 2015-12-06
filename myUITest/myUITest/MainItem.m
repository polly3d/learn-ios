//
//  MainItem.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MainItem.h"

@implementation MainItem

- (instancetype)initWithTitle:(NSString *)title className:(NSString *)className isNavigator:(BOOL)isNavigator
{
    if(self = [super init])
    {
        self.title = title;
        self.className = className;
        self.isNavigator = isNavigator;
    }
    return self;
}

+ (instancetype)initWithTitle:(NSString *)title className:(NSString *)className isNavigator:(BOOL)isNavigator
{
    MainItem *item = [[MainItem alloc] initWithTitle:title className:className isNavigator:isNavigator];
    return item;
}

@end
