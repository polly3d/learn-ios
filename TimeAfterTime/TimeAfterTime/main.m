//
//  main.m
//  TimeAfterTime
//
//  Created by wang on 15/9/6.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSDate *now = [NSDate date];
//        NSLog(@"The new date lives at %@",now);
//        
//        double seconds = [now timeIntervalSince1970];
//        NSLog(@"Is has been %f seconds since the start of 1970.",seconds);
//        
//        NSDate *later = [now dateByAddingTimeInterval:100000];
//        NSLog(@"In 100,000 seconds it will be %@",later);
//        
//        NSCalendar *cal = [NSCalendar currentCalendar];
//        NSUInteger day = [cal ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now];
//        NSLog(@"This is day %lu of the month",day);
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        NSArray *dateList = [NSArray arrayWithObjects:now,tomorrow,yesterday, nil];
//        NSLog(@"There are %lu dates",[dateList count]);
//        
//        NSLog(@"The first date is %@",[dateList objectAtIndex:0]);
//        NSLog(@"The third date is %@",[dateList objectAtIndex:2]);
        NSUInteger dateCount = [dateList count];
        for (int i = 0; i <  dateCount; i++) {
            NSDate *d = [dateList objectAtIndex:i];
            NSLog(@"Here is a date: %@",d);
        }
    }
    return 0;
}
