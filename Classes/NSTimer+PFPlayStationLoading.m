//
//  NSTimer+PFPlayStationLoading.m
//  PFPlayStationLoading
//
//  Created by Cee on 10/10/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "NSTimer+PFPlayStationLoading.h"

@implementation NSTimer (PFPlayStationLoading)

+ (NSTimer *)pf_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                         block:(void (^)())inBlock
                                       repeats:(BOOL)inRepeats {
    void (^block)() = [inBlock copy];
    NSTimer *timer = [self scheduledTimerWithTimeInterval:inTimeInterval
                                                   target:self
                                                 selector:@selector(__executeTimerBlock:)
                                                 userInfo:block
                                                  repeats:inRepeats];
    return timer;
}

+ (NSTimer *)pf_timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                block:(void (^)())inBlock
                              repeats:(BOOL)inRepeats {
    void (^block)() = [inBlock copy];
    NSTimer *timer = [self timerWithTimeInterval:inTimeInterval
                                          target:self
                                        selector:@selector(__executeTimerBlock:)
                                        userInfo:block
                                         repeats:inRepeats];
    return timer;
}

+ (void)__executeTimerBlock:(NSTimer *)inTimer {
    if ([inTimer userInfo]) {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
