//
//  QZBike.m
//  02 --kvc--kvo 设计模式
//
//  Created by qianfeng on 15/3/4.
//  Copyright (c) 2015年 侯钦哲. All rights reserved.
//

#import "QZBike.h"
@interface QZBike()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation QZBike

- (id)init
{
   
    if (self = [super init]) {
        self.speed = 0.0;
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(changeSpeed:) userInfo:nil repeats:YES];
        
    }
    return self;
}
- (void)changeSpeed:(NSTimer *)timer {

    self.speed += 0.1;
    
    if (self.speed >= 1) {
        //使定时器失效
        [_timer invalidate];
    }

}


@end
