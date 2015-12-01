//
//  MyPopViewController.h
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyPopDelegate <NSObject>

- (void)showUserInfoWith:(NSString *)username;

@end

@interface MyPopViewController : UIViewController<MyPopDelegate,UIActionSheetDelegate>

@end
