//
//  Person.m
//  BMITime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize heightInMeters,weightInkilos;
- (float) bodyMassIndex
{
    return weightInkilos / (heightInMeters * heightInMeters);
}
@end
