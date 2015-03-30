//
//  Kar.m
//  02 --kvc--kvo 设计模式
//
//  Created by qianfeng on 15/3/4.
//  Copyright (c) 2015年 侯钦哲. All rights reserved.
//

#import "Kar.h"

@implementation Kar

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    NSLog(@"value:%@, key:%@", value, key);

}

//实现自己的kvc的赋值方法
- (void)setMyValue:(id)value forKey:(NSString *)key {

    NSString *string = [NSString stringWithFormat:@"set%@:",[key capitalizedString]];
    NSLog(@"%@", string);
    
    
    SEL sel = NSSelectorFromString(string);
    
//    调用set方法 
    if ([self respondsToSelector:sel]) {
        
        [self performSelector:sel withObject:value];
        
        
    }


}

@end
