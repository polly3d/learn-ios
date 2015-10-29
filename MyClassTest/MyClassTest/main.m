//
//  main.m
//  MyClassTest
//
//  Created by wang on 15/9/7.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *string = [NSMutableString stringWithString:@"origin"];
        NSString *stringCopy = [string copy];
        //[string appendString:@"hello"];
        NSLog(@"%@",stringCopy);
    }
    return 0;
}
