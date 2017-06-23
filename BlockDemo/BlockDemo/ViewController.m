//
//  ViewController.m
//  BlockDemo
//
//  Created by Content on 2017/6/12.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Person.h"
#import "FirstViewController.h"

typedef int (^myblocks)(int,int);

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)void (^myBlock)(NSString *name);
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)UILabel *textLabel;
@property(nonatomic,copy)NSArray *sourceArray;
@property(nonatomic,copy)NSArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 50;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];

     _sourceArray = @[@"页面反向传值", @"block排序", @"block捕获变量", @"block循环引用"];
    
    [self blockDmeo1];
    [self blockDmeo2];
    [self blockDmeo3];
    [self blockDmeo4];
    
    [self name:@"想一下" set:^(NSString *name) {
       
    NSLog(@"%@",name);
        
    }];
    
    [self setBlock:^(int x, int y) {
        
     return x + y;
        
    }];
 
}
-(void)setBlock:(myblocks)blocks{

NSLog(@"%d",blocks(100,200));
    
}
//block作为参数传递给函数
-(void)name:(NSString *)name set:(void (^)(NSString *name))set{

  set(name);

}
#pragma mark ---无参无返回值
-(void)blockDmeo1{

    void (^myblock)() = ^{
    
    NSLog(@"无参无返回值");
    };
    myblock();
}
#pragma mark ---有参无返回值
-(void)blockDmeo2{
    
    void (^myblock)(int,int) = ^(int a,int b){
        
    NSLog(@"a + b = %d",a+b);
        
    };
    myblock(10,10);
}
#pragma mark ---有参有返回值
-(void)blockDmeo3{
    
    int (^myblock)(int,int) = ^(int a,int b){
        
        return a+b;
        
    };
    NSLog(@"%D",myblock(10,10));
}
#pragma mark ---无参有返回值
-(void)blockDmeo4{
    
    int (^myblock)() = ^{
        
    return 45;
        
    };
    NSLog(@"%D",myblock());
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //2
//    Person *person = [[Person alloc]init];
//    person.run(6);
//    //3
//    [person eat:^{
//    NSLog(@"吃");
//    }];
//    //4
//    int a = 5;
//    int b = 6;
//    //person.myblock(a, b);
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [_sourceArray objectAtIndex:indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
            [self gotoNextVC];
        break;
        case 1:
            [self sortBlock];
        break;
        case 2:
            [self block__block];
            break;
        case 3:
            [self block__weak];
            break;
        default:
            break;
    }
}
#pragma mark ---页面反向传值
-(void)gotoNextVC{
    
  FirstViewController *vc = [[FirstViewController alloc]init];
  [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark ---排序
-(void)sortBlock{

    NSArray *stringArray = [NSArray arrayWithObjects:@"abc 1", @"abc 21", @"abc 12",@"abc 13",@"abc 05",nil];
    NSComparator sortBlock = ^(id string1, id string2){
        
    return [string1 compare:string2];
        
    };
    NSArray *sortArray = [stringArray sortedArrayUsingComparator:sortBlock];
    NSLog(@"sortArray:%@", sortArray);

}
#pragma mark ---block捕获变量
-(void)block__block{
    
    int a= 10;
    static  int b = 5;
    //__block int b = 5;
    void (^myBlock)() = ^{
        
    b = 2;
    //b++;
    NSLog(@"a=%d,b=%d",a,b);
        
    };
    myBlock();
}
#pragma mark ---block循环引用
-(void)block__weak{

    self.arr = @[@111, @222, @333];
    __weak typeof(self) weakSelf = self;
    
    self.myBlock = ^(NSString *name){

    __strong typeof(self) strongSelf = weakSelf;
    NSLog(@"arr:  %@", strongSelf.arr);
    NSLog(@"name: %@",name);
        
    };
    self.myBlock(@"哈哈");
 
}
-(void)dealloc{

    NSLog(@"dealloc");
}
@end
