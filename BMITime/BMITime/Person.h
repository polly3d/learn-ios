//
//  Person.h
//  BMITime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    float heightInMeters;
    int weightInkilos;
}
@property float heightInMeters;
@property int weightInkilos;
- (float) bodyMassIndex;
@end
