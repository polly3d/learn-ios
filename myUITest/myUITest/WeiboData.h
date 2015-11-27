//
//  WeiboData.h
//  myUITest
//
//  Created by wang on 15/11/26.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboData : NSObject
@property (nonatomic) long long id;
@property (nonatomic,copy) NSString *profileImageURL;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *mbtype;
@property (nonatomic,copy) NSString *createAt;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *text;

- (WeiboData *)initWithDictionary:(NSDictionary *)dic;

+ (WeiboData *)initWithDictionary:(NSDictionary *)dic;

@end
