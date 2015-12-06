//
//  ItemCellData.h
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemCellData : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *className;
@property (nonatomic) BOOL isNavigator;

- (instancetype)initWithTitle:(NSString *)title className:(NSString *)className isNavigator:(BOOL)isNavigator;

+ (instancetype)initWithTitle:(NSString *)title className:(NSString *)className isNavigator:(BOOL)isNavigator;
@end
