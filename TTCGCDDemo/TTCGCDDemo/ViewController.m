//
//  ViewController.m
//  TTCGCDDemo
//
//  Created by 赵婷 on 2017/11/9.
//  Copyright © 2017年 赵婷. All rights reserved.
//

#import "ViewController.h"
#import "TTCGCDHeader.h"
@interface ViewController ()

@property (nonatomic, strong) TTCGCDTimer *timer;//!<

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TTCGCDQueue *que = [[TTCGCDQueue alloc]initConcurrentWithLabel:@"默认队列"];
    
    [que execute:^{
        NSLog(@"打印当前线程-----%@", [NSThread currentThread]);
        
    }];
    [que execute:^{
        NSLog(@"打印当前线程-----%@", [NSThread currentThread]);
        
    }];
    [TTCGCDQueue executeInGlobalQueue:^{
        
        // 子线程下载数据
        
        [TTCGCDQueue executeInMainQueue:^{
            
            // 返回主线程刷新UI
        }];
    }];
    
    
    
    // 创建一个组
    TTCGCDGroup *group = [TTCGCDGroup new];
    
    //添加队列到组
    [[TTCGCDQueue globalQueue] execute:^{
        NSLog(@"队列1");
        // task one
        NSLog(@"打印当前线程-----%@", [NSThread currentThread]);
        
        
    } inGroup:group];
    
    // 添加队列到组
    [[TTCGCDQueue globalQueue] execute:^{
        NSLog(@"队列2");
        NSLog(@"打印当前线程-----%@", [NSThread currentThread]);
        
        // task two
        
    } inGroup:group];
    
    // 当执行完组内所有线程中任务后回调
    [[TTCGCDQueue mainQueue] notify:^{
        NSLog(@"组内任务执行完毕");
        NSLog(@"打印当前线程-----%@", [NSThread currentThread]);
        // task three
        
    } inGroup:group];
    
    
    
    
    // GCD定时器
    self.timer = [[TTCGCDTimer alloc] initInQueue:[TTCGCDQueue mainQueue]];
    
    // timer event
    [self.timer event:^{
        
        // task
        
    } timeInterval:NSEC_PER_SEC * 3 delay:NSEC_PER_SEC * 3];
    
    // start timer
    [self.timer start];
    
    
    
    
    // init semaphore
    TTCGCDSemaphore *semaphore = [TTCGCDSemaphore new];
    
    // wait
    [TTCGCDQueue executeInGlobalQueue:^{
        
        [semaphore wait];
        
        // todo sth else
    }];
    
    // signal
    [TTCGCDQueue executeInGlobalQueue:^{
        
        // do sth
        [semaphore signal];
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
