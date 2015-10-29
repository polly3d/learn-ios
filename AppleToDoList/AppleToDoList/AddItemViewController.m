//
//  AddItemViewController.m
//  AppleToDoList
//
//  Created by wang on 15/9/17.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBtn;
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(sender != self.saveBtn)return;
    if(self.textfield.text.length > 0)
    {
        self.item = [[ToDoItem alloc] init];
        self.item.itemName = self.textfield.text;
        self.item.complete = NO;
    }
}

@end
