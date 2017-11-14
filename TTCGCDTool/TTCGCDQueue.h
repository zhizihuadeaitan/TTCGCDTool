//
//  TTCGCDQueue.h
//  TTCGCDDemo
//
//  Created by 赵婷 on 2017/11/10.
//  Copyright © 2017年 赵婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTCGCDGroup;

@interface TTCGCDQueue : NSObject

@property (strong, readonly, nonatomic) dispatch_queue_t dispatchQueue;//!<只读队列

+ (TTCGCDQueue *)mainQueue;//!<主队列
+ (TTCGCDQueue *)globalQueue;//!<
+ (TTCGCDQueue *)highPriorityGlobalQueue;//!<
+ (TTCGCDQueue *)lowPriorityGlobalQueue;//!<
+ (TTCGCDQueue *)backgroundPriorityGlobalQueue;//!<

#pragma mark - 便利的构造方法
+ (void)executeInMainQueue:(dispatch_block_t)block;
+ (void)executeInGlobalQueue:(dispatch_block_t)block;
+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block;
+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block;
+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block;
+ (void)executeInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeInGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;

#pragma 初始化
- (instancetype)init;
- (instancetype)initSerial;
- (instancetype)initSerialWithLabel:(NSString *)label;
- (instancetype)initConcurrent;
- (instancetype)initConcurrentWithLabel:(NSString *)label;

#pragma mark - 用法
- (void)execute:(dispatch_block_t)block;//!<并行队列
- (void)execute:(dispatch_block_t)block afterDelay:(int64_t)delta;//!<延迟执行
- (void)execute:(dispatch_block_t)block afterDelaySecs:(float)delta;//!<延迟执行秒
- (void)waitExecute:(dispatch_block_t)block;//!<串行队列
- (void)barrierExecute:(dispatch_block_t)block;//!<等待前面执行，执行完自己后执行后面
- (void)waitBarrierExecute:(dispatch_block_t)block;//!<等待前面执行，执行完自己后执行后面
- (void)suspend;//!<暂停队列
- (void)resume;//!<恢复队列

#pragma mark - 与GCDGroup相关
/**
 *  并行执行的线程
 *
 *  @param block 回调方法
 *  @param group 组
 
 */
- (void)execute:(dispatch_block_t)block inGroup:(TTCGCDGroup *)group;

/**
 *  汇总结果
 *
 *  @param block 回调方法
 *  @param group 组

 */
- (void)notify:(dispatch_block_t)block inGroup:(TTCGCDGroup *)group;


@end
