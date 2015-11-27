//
//  WeiboTableViewCell.h
//  myUITest
//
//  Created by wang on 15/11/26.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiboData;

@interface WeiboTableViewCell : UITableViewCell

@property (nonatomic,strong) WeiboData *data;
@property (nonatomic) CGFloat height;

@end
