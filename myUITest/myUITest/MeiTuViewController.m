//
//  MeiTuViewController.m
//  myUITest
//
//  Created by wang on 15/12/2.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MeiTuViewController.h"

@interface MeiTuViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIImagePickerController *_imagePickerController;
    UIImageView *_imageView;
    CIContext *_context;//Core Image上下文
    CIImage *_image;
    CIImage *_outputImage;
    CIFilter *_colorControlsFilter;
}
@end

@implementation MeiTuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
}

- (void)initUI
{
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 502)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view  addSubview:_imageView];
    
    UIBarButtonItem *opentBtn = [[UIBarButtonItem alloc] initWithTitle:@"打开" style:UIBarButtonItemStyleDone target:self action:@selector(openPhoto:)];
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(savePhoto:)];
    
    self.navigationItem.rightBarButtonItems = @[opentBtn,saveBtn];
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"打开" style:UIBarButtonItemStyleDone target:self action:nil];
    
    
    //下方控制面板
    UIView *controlView = [[UIView alloc] initWithFrame:CGRectMake(0, 450, 320, 118)];
    [self.view addSubview:controlView];
    
    [self createSlider:CGRectMake(10, 10, 60, 25) title:@"饱和度" parentView:controlView sliderRect:CGRectMake(80, 10, 230, 30) min:0 max:2 value:1 action:@selector(changeStaturation:)];
    
    [self createSlider:CGRectMake(10, 40, 60, 25) title:@"亮度" parentView:controlView sliderRect:CGRectMake(80, 40, 230, 30) min:-1 max:1 value:0 action:@selector(changeBrightness:)];
    [self createSlider:CGRectMake(10, 70, 60, 25) title:@"对比度" parentView:controlView sliderRect:CGRectMake(80, 70, 230, 30) min:0 max:2 value:1 action:@selector(changeBrightness:)];
    
    _context = [CIContext contextWithOptions:nil];
    
    _colorControlsFilter = [CIFilter filterWithName:@"CIColorControls"];
    
}

- (void)createSlider:(CGRect)labelRect title:(NSString *)title parentView:(UIView *)view sliderRect:(CGRect)slideRect min:(int)min max:(int)max value:(int)value action:(SEL)action
{
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    label.text = title;
    label.font = [UIFont systemFontOfSize:12];
    [view addSubview:label];
    UISlider *slider = [[UISlider alloc] initWithFrame:slideRect];
    [view addSubview:slider];
    slider.minimumValue = min;
    slider.maximumValue = max;
    slider.value = value;
    [slider addTarget:self action:action forControlEvents:UIControlEventValueChanged];
}

#pragma mark - 代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *selectedImg = [info objectForKey:UIImagePickerControllerOriginalImage];
    _imageView.image = selectedImg;
    
    _image = [CIImage imageWithCGImage:selectedImg.CGImage];
    [_colorControlsFilter setValue:_image forKey:@"inputImage"];
}

- (void)setImage
{
    CIImage *outputImage = [_colorControlsFilter outputImage];
    CGImageRef temp = [_context createCGImage:outputImage fromRect:[outputImage extent]];
    _imageView.image = [UIImage imageWithCGImage:temp];
    CGImageRelease(temp);
}

- (void)openPhoto:(UIBarButtonItem *)item
{
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}

- (void)savePhoto:(UIBarButtonItem *)item
{
    UIImageWriteToSavedPhotosAlbum(_imageView.image, nil, nil, nil);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"图片保存成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)changeStaturation:(UISlider *)slider
{
    [_colorControlsFilter setValue:[NSNumber numberWithFloat:slider.value] forKey:@"inputSaturation"];
    [self setImage];
}

- (void)changeBrightness:(UISlider *)slider
{
    [_colorControlsFilter setValue:[NSNumber numberWithFloat:slider.value] forKey:@"inputBrightness"];
    [self setImage];
}

- (void)changeContrast:(UISlider *)slider
{
    [_colorControlsFilter setValue:[NSNumber numberWithFloat:slider.value] forKey:@"inputContrast"];
    [self setImage];
}

@end
