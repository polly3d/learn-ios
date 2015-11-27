//
//  ContactGroup.m
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "ContactGroup.h"

@implementation ContactGroup

- (ContactGroup *)initWithName:(NSString *)name detail:(NSString *)detail contacts:(NSMutableArray *)contacts
{
    if(self = [super init])
    {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+ (ContactGroup *)initWithName:(NSString *)name detail:(NSString *)detail contacts:(NSMutableArray *)contacts
{
    ContactGroup *group = [[ContactGroup alloc] initWithName:name detail:detail contacts:contacts];
    return group;
}

@end
