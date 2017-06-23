//
//  SecondViewController.m
//  BlockDemo
//
//  Created by Content on 2017/6/12.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,copy)UITextField *textfield;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textfield = [[UITextField alloc]initWithFrame:CGRectMake((375-100)/2, 100, 100, 30)];
    _textfield.layer.borderColor = [UIColor blackColor].CGColor;
    _textfield.layer.borderWidth = 1;
    [self.view addSubview:_textfield];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //声明一个颜色
    UIColor *color = [UIColor yellowColor];
    //用刚刚声明的那个Block去回调修改上一界面的背景色
    self.backgroundColor(color);
    self.nextVCText(_textfield.text);
}

@end
