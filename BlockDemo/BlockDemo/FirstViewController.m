
//
//  FirstViewController.m
//  BlockDemo
//
//  Created by Content on 2017/6/14.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)UILabel *textLabel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake((375-100)/2, 100, 100, 30)];
    [self.view addSubview:_textLabel];
    _textLabel.text = @"text";
    
    UIButton *click = [[UIButton alloc]initWithFrame:CGRectMake((375-100)/2, 200, 100, 30)];
    [click setTitle:@"下一页面" forState:UIControlStateNormal];
    [click setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //[self.view addSubview:click];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
     SecondViewController*vc =[[SecondViewController alloc]init];
    // 回调修改颜色
    __weak typeof(self) weakSelf = self;
    vc.backgroundColor = ^(UIColor *color){
        
    weakSelf.view.backgroundColor = color;
        
    };
    vc.nextVCText = ^(NSString *text) {
    weakSelf.textLabel.text = text;
    };
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
