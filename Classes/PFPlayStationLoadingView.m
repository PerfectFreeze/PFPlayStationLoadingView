//
//  PFPlayStationLoadingView.m
//  PFPlayStationLoading
//
//  Created by Cee on 10/10/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "PFPlayStationLoadingView.h"
#import "PFPlayStationLoadingItem.h"
#import "NSTimer+PFPlayStationLoading.h"

@interface PFPlayStationLoadingView ()
@property (nonatomic, strong) PFPlayStationLoadingItem *item1;
@property (nonatomic, strong) PFPlayStationLoadingItem *item2;
@property (nonatomic, strong) PFPlayStationLoadingItem *item3;
@property (nonatomic, strong) PFPlayStationLoadingItem *item4;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL animating;
@end

@implementation PFPlayStationLoadingView

- (id)initWithFrame:(CGRect)frame sideLength:(CGFloat)length type:(PFPlayStationLoadingViewType)type {
    CGFloat width, height, padding;
    padding = ceil(length / 20.f);
    switch (type) {
        case PFPlayStationLoadingViewTypeSquare:
            width = length * 2.f + padding;
            height = length * 2.f + padding;
            break;
        default:
            width = length * 4.f + 3 * padding;
            height = length;
            break;
    }
    
    self = [super initWithFrame:CGRectMake(frame.origin.x,
                                           frame.origin.y,
                                           width, height)];
    if (self) {
        switch (type) {
            case PFPlayStationLoadingViewTypeSquare:
                _item1 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(0, 0, length, length)];
                _item2 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(length + padding, 0, length, length)];
                _item3 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(0, length + padding, length, length)];
                _item4 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(length + padding, length + padding, length, length)];
                break;
            default:
                _item1 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(0, 0, length, length)];
                _item2 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(length + padding, 0, length, length)];
                _item3 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(length * 2 + padding * 2, 0, length, length)];
                _item4 = [[PFPlayStationLoadingItem alloc] initWithFrame:CGRectMake(length * 3 + padding * 3, 0, length, length)];
                break;
        }
        [self addSubview:_item1];
        [self addSubview:_item2];
        [self addSubview:_item3];
        [self addSubview:_item4];
        self.animating = NO;
    }
    
    return self;
}

- (BOOL)isAnimating {
    return self.animating;
}

- (void)startAnimating {
    if (self.animating) {
        return;
    }
    self.animating = YES;
    self.alpha = 1.f;
    [self animateOnce];
    self.timer = [NSTimer pf_scheduledTimerWithTimeInterval:4.f block:^{
        [self animateOnce];
    } repeats:YES];
}

- (void)stopAnimating {
    [self.timer invalidate];
    self.timer = nil;
    [UIView animateWithDuration:.5f animations:^{
        self.alpha = 0.f;
    }];
    self.animating = NO;
}

- (void)animateOnce {
    NSUInteger r;
    r = arc4random_uniform(4);
    _item1.type = r;
    r = arc4random_uniform(4);
    _item2.type = r;
    r = arc4random_uniform(4);
    _item3.type = r;
    r = arc4random_uniform(4);
    _item4.type = r;
    [_item1 startAnimationWithDelay:0];
    [_item2 startAnimationWithDelay:.2f];
    [_item3 startAnimationWithDelay:.4f];
    [_item4 startAnimationWithDelay:.6f];
}
@end
