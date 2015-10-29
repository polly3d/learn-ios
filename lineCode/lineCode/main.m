//
//  main.m
//  lineCode
//
//  Created by wang on 15/10/21.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Test.h"

int main(int argc,const char * argv[])
{
    @autoreleasepool {
        
        Person *person = [Person initWith:@"wang" age:28];
        [person sayHi];
        NSLog(@"%@" ,person);
        
        Animal *ani = [[Animal alloc] init];
        ani.name = @"ani";
        
        Girl *girl = [[Girl alloc] init];
        girl.name = @"girl";
    }
    return 0;
}