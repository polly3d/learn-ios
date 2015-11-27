//
//  WeiboData.m
//  myUITest
//
//  Created by wang on 15/11/26.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "WeiboData.h"

@implementation WeiboData

- (WeiboData *)initWithDictionary:(NSDictionary *)dic
{
    if(self = [super init])
    {
        self.id = [dic[@"id"] longLongValue];
        self.profileImageURL = dic[@"profileImageURL"];
        self.userName = dic[@"userName"];
        self.mbtype = dic[@"vip"];
        self.createAt = dic[@"createAt"];
        self.source = dic[@"source"];
        self.text = dic[@"text"];
    }
    return self;
}

- (NSString *)source
{
    return [NSString stringWithFormat:@"来自%@",_source];
}

+ (WeiboData *)initWithDictionary:(NSDictionary *)dic
{
    WeiboData *data = [[WeiboData alloc] initWithDictionary:dic];
    return data;
}
@end
