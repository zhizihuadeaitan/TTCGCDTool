//
//  TTCGCDGroup.h
//  TTCGCDDemo
//
//  Created by 赵婷 on 2017/11/10.
//  Copyright © 2017年 赵婷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTCGCDGroup : NSObject

@property (strong, nonatomic, readonly) dispatch_group_t dispatchGroup;//!<只读队列组

#pragma 初始化
- (instancetype)init;

#pragma mark - 用法
- (void)enterGroup;
- (void)leaveGroup;
- (void)waitGroup;
- (BOOL)waitGroup:(int64_t)delta;

@end
