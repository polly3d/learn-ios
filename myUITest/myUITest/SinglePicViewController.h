//
//  SinglePicViewController.h
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePicViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *imageView;

@end
