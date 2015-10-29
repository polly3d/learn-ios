//
//  Person.m
//  lineCode
//
//  Created by wang on 15/10/22.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "Person.h"


@interface Person()

@property (nonatomic) NSString *username;


@end

@implementation Person


- (void)sayBaba
{
    NSLog(@"hello baba");
}

- (void)sayHi
{
    NSLog(@"Hello world,%@.Your age is %li",self.name,(long)self.age);
}

- (id)initWith:(NSString *)name age:(NSInteger)age
{
    if(self = [super init])
    {
        self.name = name;
        self.age = age;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"my name is %@,I'm %ld yeas old.",self.name,(long)self.age];
}

+ (id)initWith:(NSString *)name age:(NSInteger)age
{
    Person *person = [[Person alloc] initWith:name age:age];
    return person;
}

@end
