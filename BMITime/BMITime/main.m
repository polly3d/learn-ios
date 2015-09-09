//
//  main.m
//  BMITime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Employee *person = [[Employee alloc] init];
//        [person setWeightInkilos:96];
//        [person setHeightInMeters:1.8];
//        [person setEmployeeID:15];
//        float bmi = [person bodyMassIndex];
//        NSLog(@"Employee %d has a BMI of %f",[person employeeID],bmi);
        NSMutableArray *employee = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            Employee *person = [[Employee alloc] init];
            [person setWeightInkilos:90 + i];
            [person setHeightInMeters:1.8 - i / 10.0];
            [person setEmployeeID:i];
            [employee addObject:person];
        }
        
        for (int i = 0; i < 10; i++) {
            Asset *asset = [[Asset alloc] init];
            NSString *currentLable = [NSString stringWithFormat:@"Laptop %d",i];
            [asset setLabel:currentLable];
            [asset setResaleValue:i * 17];
            NSUInteger randomNum = random() % [employee count];
            NSLog(@"randomNum:%lu",(unsigned long)randomNum);
            Employee *randomEmployee = [employee objectAtIndex:randomNum];
            [randomEmployee addAssetsObject:asset];
        }
        NSLog(@"Employees:%@",employee);
        NSLog(@"Giving up ownership of one employee");
        [employee removeObjectAtIndex:5];
        NSLog(@"Giving up ownership of array");
        employee = nil;
    }
    return 0;
}
