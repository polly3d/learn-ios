//
//  WeiboTableViewCell.m
//  myUITest
//
//  Created by wang on 15/11/26.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "WeiboTableViewCell.h"
#import "WeiboData.h"
#define MyColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] //颜色宏定义
#define WeiboTableViewCellBackgroundColor MyColor(251,251,251)
#define WeiboGrayColor MyColor(50,50,50)
#define WeiboLightGrayColor MyColor(120,120,120)

#define WeiboUserNameFontSize 14
#define WeiboCreateAtFontSize 12
#define WeiboSourceFontSize 12
#define WeiboTextFontSize 14

#define WeiboCellSpacing 10
#define WeiboCellAvatarWidth 50
#define WeiboCellAvatarHeight WeiboCellAvatarWidth
#define WeiboCellMbTypeWidth 15
#define WeiboCellMbTypeHeight 14

@interface WeiboTableViewCell()
{
    UIImageView *_avatar;
    UIImageView *_mbType;
    UILabel *_userName;
    UILabel *_createAt;
    UILabel *_source;
    UILabel *_text;
}

@end

@implementation WeiboTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    _avatar = [[UIImageView alloc] init];
    [self.contentView addSubview:_avatar];
    
    _userName = [[UILabel alloc] init];
    _userName.textColor = WeiboGrayColor;
    _userName.font = [UIFont systemFontOfSize:WeiboUserNameFontSize];
    [self.contentView addSubview:_userName];
    
    _mbType = [[UIImageView alloc] init];
    [self.contentView addSubview:_mbType];
    
    _createAt = [[UILabel alloc] init];
    _createAt.textColor = WeiboLightGrayColor;
    _createAt.font = [UIFont systemFontOfSize:WeiboCreateAtFontSize];
    [self.contentView addSubview:_createAt];
    
    _source = [[UILabel alloc] init];
    _source.textColor = WeiboLightGrayColor;
    _source.font = [UIFont systemFontOfSize:WeiboSourceFontSize];
    [self.contentView addSubview:_source];
    
    _text = [[UILabel alloc] init];
    _text.textColor = WeiboGrayColor;
    _text.font = [UIFont systemFontOfSize:WeiboTextFontSize];
    _text.numberOfLines = 0;
    [self.contentView addSubview:_text];
    
}

- (void)setData:(WeiboData *)data
{
    _data = data;
    CGFloat avatarX = 10,avatarY = 10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, WeiboCellAvatarWidth, WeiboCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:data.profileImageURL];
    _avatar.frame = avatarRect;
    
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame)+WeiboCellSpacing;
    CGFloat userNameY = avatarY;
    CGSize userNameSize = [data.userName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:WeiboUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = _data.userName;
    _userName.frame = userNameRect;
    
    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame) + WeiboCellSpacing;
    CGFloat mbTypeY = avatarY;
    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY, WeiboCellMbTypeWidth, WeiboCellMbTypeHeight);
    _mbType.image = [UIImage imageNamed:_data.mbtype];
    _mbType.frame = mbTypeRect;
    
    CGSize createAtSize = [_data.createAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:WeiboCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) - createAtSize.height;
    CGRect createRect = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _createAt.text = _data.createAt;
    _createAt.frame = createRect;
    
    CGSize sourceSize = [_data.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:WeiboSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(createRect) + WeiboCellSpacing;
    CGFloat sourceY = createAtY;
    _source.text = _data.source;
    _source.frame = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame) + WeiboCellSpacing;
    CGFloat textWidth = self.frame.size.width - WeiboCellSpacing * 2;
    CGSize textSize = [_data.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:WeiboTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = _data.text;
    _text.frame = textRect;
    
    _height = CGRectGetMaxY(_text.frame) + WeiboCellSpacing;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
