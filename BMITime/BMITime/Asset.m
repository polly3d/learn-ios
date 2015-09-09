//
//  Asset.m
//  BMITime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "Asset.h"

@implementation Asset
@synthesize label,resaleValue;
- (NSString *) description
{
    return [NSString stringWithFormat:@"<%@: $%d>",[self label],[self resaleValue]];
}
- (void) dealloc
{
    NSLog(@"deallocating %@",self);
}
@end
