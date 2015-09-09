//
//  Employee.h
//  BMITime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "Person.h"
@class Asset;

@interface Employee : Person
{
    int employeeID;
    NSString *lastName;
    Person *spouse;
    NSMutableArray *children;
    NSMutableArray *assets;
}
@property int employeeID;
- (void) addAssetsObject:(Asset *)a;
- (unsigned int) valueOfAssets;
@end
