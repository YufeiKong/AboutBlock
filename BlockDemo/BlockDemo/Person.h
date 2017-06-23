//
//  Person.h
//  BlockDemo
//
//  Created by Content on 2017/6/12.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy)void (^myblock)(int,int);


- (void)eat:(void(^)())block;
- (void(^)(int))run;

@end
