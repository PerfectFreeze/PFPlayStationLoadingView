//
//  NSTimer+PFPlayStationLoading.h
//  PFPlayStationLoading
//
//  Created by Cee on 10/10/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (PFPlayStationLoading)

+ (NSTimer *)pf_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                         block:(void (^)())inBlock
                                       repeats:(BOOL)inRepeats;
+ (NSTimer *)pf_timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                block:(void (^)())inBlock
                              repeats:(BOOL)inRepeats;

@end
