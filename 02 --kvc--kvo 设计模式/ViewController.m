//
//  ViewController.m
//  02 --kvc--kvo 设计模式
//
//  Created by qianfeng on 15/3/4.
//  Copyright (c) 2015年 侯钦哲. All rights reserved.
//

#import "ViewController.h"
#import "Kar.h"
#import "QZBike.h"


@interface ViewController ()

@property (nonatomic,strong) QZBike *bike;

@property (nonatomic,strong) UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     1.KVC
    
     2.KVO
     3.设计模式
     */
    _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    _progressView.frame = CGRectMake(10, 100, 400, 20);
    
    [self.view addSubview:_progressView];
    
    
    
    
    
    
    
    //[self testKVC];
//    kvo
    [self testKVO];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)testKVC {
    //什么是KVC：使用字符串标示符去表示对象的属性。
    //作用：将字典的数据与模型的数据之间进行转换
    //全称： key-value-coding 键值编码
    /*
     针对的是对象的属性,村取值
     直接赋值（set）
     */
    Kar *car = [[Kar alloc] init];
    car.name = @"宝马";

    //通过kvc赋值
    //注意1：value的值就是属性的值 2.forKey：后面的这个key就是属性的名称（******）
    [car setValue:@"奔驰" forKey:@"name"];
    
    NSLog(@"%@,%@", car.name, [car valueForKey:@"name"] );
    
    //增加知识点：key可以与属性名称相同，还可以与成员变量相同 
    [car setValue:[NSNumber numberWithInt:35] forKey:@"speed"];
    
    NSLog(@"%@",[car valueForKey:@"speed"]);
    
    //字典转化成对象
    NSDictionary *dic = @{@"name":@"成龙"};
    
    [car setValuesForKeysWithDictionary:dic];
    
    NSLog(@"%@", car.name);
//    keypath的使用
    Engine *myEngine = [[Engine alloc] init];
    
    car.engine = myEngine;
   // car.engine.model = @"1234";
    
//    将属性拼成一个路径，作为key
    [car setValue:@"5678" forKey:@"engine.model"];
    [car valueForKeyPath:@"engine.model"];
    
    NSLog(@"%@", car.engine.model);
    
    //KVC的原理
    //写一个自己的setValue:forKey:方法
    [car setMyValue:@"张国立" forKey:@"name"];
    NSLog(@"%@", car.name);
    
}

//2.KVO
- (void)testKVO {
//    什么是KVO。Key Value Observing, 键值监听
    
//    KVO作用：观察（监听）对象的属性的变化，根据变化，去做一些事情（方法）
    //例子：记录车的速度的变化
    _bike = [[QZBike alloc] init];
/*
    第一个参数：添加的观察值
    第二个参数：要观察的key（属性）
    第三个参数：属性在变化时得一些值
    第四个参数：忽略
 */
   [_bike addObserver:self forKeyPath:@"speed" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    

}
- (void)viewWillDisappear:(BOOL)animated {
    
    [_bike removeObserver:self forKeyPath:@"speed" context:nil];

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

    NSLog(@"keyPath:%@, object:%@, change:%@",keyPath, object, change);
    CGFloat mySpeed = [[object valueForKey:keyPath] floatValue];
    _progressView.progress = mySpeed;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
