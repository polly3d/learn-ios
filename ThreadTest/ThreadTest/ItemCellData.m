//
//  ItemCellData.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "ItemCellData.h"

@implementation ItemCellData

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
    ItemCellData *item = [[ItemCellData alloc] initWithTitle:title className:className isNavigator:isNavigator];
    return item;
}

@end
