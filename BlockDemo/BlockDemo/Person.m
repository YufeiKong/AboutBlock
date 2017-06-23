//
//  Person.m
//  BlockDemo
//
//  Created by Content on 2017/6/12.
//  Copyright © 2017年 flymanshow. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat:(void(^)())block{

    block();

}

-(void(^)(int))run{

    return ^(int b){
    
    NSLog(@"b = %d",b);
    
    };

}

@end
