//
//  Contact.h
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;
@property (nonatomic,copy) NSString *phoneNumber;

- (NSString *)getName;

- (Contact *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;

+ (Contact *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber;

@end
