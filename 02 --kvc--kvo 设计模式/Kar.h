//
//  Kar.h
//  02 --kvc--kvo 设计模式
//
//  Created by qianfeng on 15/3/4.
//  Copyright (c) 2015年 侯钦哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Engine.h"

@interface Kar : NSObject
{
    int speed;//速度

}
@property (nonatomic,copy) NSString *name;//车的名字
@property (nonatomic,strong) Engine *engine;


- (void)setMyValue:(id)value forKey:(NSString *)key;

@end
