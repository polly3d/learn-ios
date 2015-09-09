//
//  Employee.m
//  BMITime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "Employee.h"
#import "Asset.h"

@implementation Employee
@synthesize employeeID;
- (float) bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (void) addAssetsObject:(Asset *)a
{
    if(!assets)
    {
        assets = [[NSMutableArray alloc] init];
    }
    [assets addObject:a];
}
- (unsigned int) valueOfAssets
{
    unsigned int sum = 0;
    for(Asset * a in assets)
    {
        sum += [a resaleValue];
    }
    return sum;
}
- (NSString *) description
{
    return [NSString stringWithFormat:@"<Employee %d: $%d in assets>",[self employeeID],[self valueOfAssets]];
}
- (void) dealloc
{
    NSLog(@"dellocating %@",self);
}
@end
