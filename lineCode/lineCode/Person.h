//
//  Person.h
//  lineCode
//
//  Created by wang on 15/10/22.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic,strong) NSString *sex;

- (void)sayHi;

- (id)initWith:(NSString *)name age:(NSInteger)age;

+ (id)initWith:(NSString *)name age:(NSInteger)age;

@end
