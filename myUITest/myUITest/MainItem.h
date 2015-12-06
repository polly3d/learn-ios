//
//  MainItem.h
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainItem : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *className;
@property (nonatomic) BOOL isNavigator;

- (instancetype)initWithTitle:(NSString *)title className:(NSString *)className isNavigator:(BOOL)isNavigator;
+ (instancetype)initWithTitle:(NSString *)title className:(NSString *)className isNavigator:(BOOL)isNavigator;

@end
