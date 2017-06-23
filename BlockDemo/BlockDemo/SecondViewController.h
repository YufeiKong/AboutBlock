//
//  SecondViewController.h
//  BlockDemo
//
//  Created by Content on 2017/6/12.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
typedef void(^changeColor)(id);

/**
 *  用上面定义的changeColor声明一个Block,声明的这个Block必须遵守声明的要求。
 */
@property (nonatomic, copy) changeColor backgroundColor;
@property (nonatomic, copy) void (^nextVCText)(NSString
*text);

@end
