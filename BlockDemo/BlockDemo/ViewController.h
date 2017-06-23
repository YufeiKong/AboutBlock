//
//  ViewController.h
//  BlockDemo
//
//  Created by Content on 2017/6/12.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef float (^floatNumBlock)(float,float);


@interface ViewController : UIViewController

@property(nonatomic,copy)floatNumBlock numBlock;
@end

