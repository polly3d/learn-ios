//
//  ToDoItem.h
//  AppleToDoList
//
//  Created by wang on 15/9/17.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (strong,nonatomic) NSString *itemName;
@property (nonatomic) BOOL complete;

@end
