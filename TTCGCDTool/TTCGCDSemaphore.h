//
//  TTCGCDSemaphore.h
//  TTCGCDDemo
//
//  Created by 赵婷 on 2017/11/10.
//  Copyright © 2017年 赵婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTCGCDSemaphore : NSObject

@property (strong, readonly, nonatomic) dispatch_semaphore_t dispatchSemaphore;


#pragma 初始化
- (instancetype)init;
- (instancetype)initWithValue:(long)value;

#pragma mark - 用法
- (BOOL)signal;
- (void)wait;
- (BOOL)wait:(int64_t)delta;

@end
