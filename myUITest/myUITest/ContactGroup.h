//
//  ContactGroup.h
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactGroup : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,strong) NSMutableArray *contacts;

- (ContactGroup *)initWithName:(NSString *)name detail:(NSString *)detail contacts:(NSMutableArray *)contacts;

+ (ContactGroup *)initWithName:(NSString *)name detail:(NSString *)detail contacts:(NSMutableArray *)contacts;

@end
