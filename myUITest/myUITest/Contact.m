//
//  Contact.m
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)getName
{
    return [NSString stringWithFormat:@"%@%@",self.lastName,self.firstName];
}

- (Contact *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
    if(self = [super init])
    {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    
    return self;
}

+ (Contact *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber
{
    Contact *contact = [[Contact alloc] initWithFirstName:firstName lastName:lastName phoneNumber:phoneNumber];
    return contact;
}

@end
