//
//  QuartzItem.m
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "QuartzItem.h"

@implementation QuartzItem

- (instancetype)initWithItemName:(NSString *)name className:(NSString *)className
{
    if(self = [super init])
    {
        self.itemName = name;
        self.itemClassName = className;
    }
    return self;
}
@end
