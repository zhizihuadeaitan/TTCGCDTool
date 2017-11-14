//
//  TTCGCDGroup.m
//  TTCGCDDemo
//
//  Created by 赵婷 on 2017/11/10.
//  Copyright © 2017年 赵婷. All rights reserved.
//

#import "TTCGCDGroup.h"

@interface TTCGCDGroup ()

@property (strong, nonatomic, readwrite) dispatch_group_t dispatchGroup;//!<读写队列组

@end

@implementation TTCGCDGroup

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        self.dispatchGroup = dispatch_group_create();
    }
    
    return self;
}
- (void)enterGroup{
    
    dispatch_group_enter(self.dispatchGroup);
}

- (void)leaveGroup{
    
    dispatch_group_leave(self.dispatchGroup);
}

- (void)waitGroup{
    
    dispatch_group_wait(self.dispatchGroup, DISPATCH_TIME_FOREVER);
}

- (BOOL)waitGroup:(int64_t)delta{
    
    return dispatch_group_wait(self.dispatchGroup, dispatch_time(DISPATCH_TIME_NOW, delta)) == 0;
}

@end
