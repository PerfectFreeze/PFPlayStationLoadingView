//
//  PFPlayStationLoadingItem.m
//  PFPlayStationLoading
//
//  Created by Cee on 9/21/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "PFPlayStationLoadingItem.h"
#import <QuartzCore/QuartzCore.h>

@interface PFPlayStationLoadingItem ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation PFPlayStationLoadingItem

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame type:(PFPlayStationLoadingItemType)type {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        self.type = type;
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _imageView;
}

- (void)setType:(PFPlayStationLoadingItemType)type {
    _type = type;
    self.imageView.layer.affineTransform = CGAffineTransformIdentity;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [bundle URLForResource:@"PFPlayStationLoading" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    NSString *path;
    switch (type) {
        case PFPlayStationLoadingItemTypeCircle:
            path = [imageBundle pathForResource:@"circle" ofType:@"png"];
            break;
        case PFPlayStationLoadingItemTypeCross:
            path = [imageBundle pathForResource:@"cross" ofType:@"png"];
            break;
        case PFPlayStationLoadingItemTypeRectangle:
            path = [imageBundle pathForResource:@"rect" ofType:@"png"];
            break;
        case PFPlayStationLoadingItemTypeTriangle:
            path = [imageBundle pathForResource:@"triangle" ofType:@"png"];
            break;
        default:
            break;
    }
    [self.imageView setImage:[UIImage imageWithContentsOfFile:path]];
}

- (void)startAnimationWithDelay:(NSTimeInterval)delay {
    CGFloat fromDegree, toDegree;
    if (self.type == PFPlayStationLoadingItemTypeTriangle) {
        [self setAnchorPoint:CGPointMake(.5f, 1 - 136.f / 380.f) forView:self.imageView];
        fromDegree = -2 * M_PI / 3.f;
        toDegree = 0;
    } else {
        [self setAnchorPoint:CGPointMake(.5f, .5f) forView:self.imageView];
        fromDegree = 0;
        toDegree = M_PI_2;
    }
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.beginTime = 0.f + delay;
    scale.duration = .5f;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scale.fromValue = [NSNumber numberWithFloat:0.f];
    scale.toValue = [NSNumber numberWithFloat:1.f];
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.beginTime = 0.f + delay;
    rotation.duration = .5f;
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotation.fromValue = [NSNumber numberWithFloat:fromDegree];
    rotation.toValue = [NSNumber numberWithFloat:toDegree];
    
    CABasicAnimation *stable = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    stable.beginTime = .5f + delay;
    stable.duration = 2.f;
    stable.fromValue = [NSNumber numberWithFloat:toDegree];
    stable.toValue = [NSNumber numberWithFloat:toDegree];
    
    CABasicAnimation *stable2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    stable2.beginTime = .5f + delay;
    stable2.duration = 2.f;
    stable2.fromValue = [NSNumber numberWithFloat:1.f];
    stable2.toValue = [NSNumber numberWithFloat:1.f];
    
    CABasicAnimation *scale2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale2.beginTime = 2.5f + delay;
    scale2.duration = .5f;
    scale2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    scale2.fromValue = [NSNumber numberWithFloat:1.f];
    scale2.toValue = [NSNumber numberWithFloat:0.f];
    
    CABasicAnimation *rotation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation2.beginTime = 2.5f + delay;
    rotation2.duration = .5f;
    rotation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    rotation2.fromValue = [NSNumber numberWithFloat:toDegree];
    rotation2.toValue = [NSNumber numberWithFloat:2 * toDegree - fromDegree];
    
    group.animations = @[scale, rotation, stable, stable2, scale2, rotation2];
    group.beginTime = 0.f;
    group.duration = 3.f + delay;
    group.autoreverses = NO;
    group.repeatCount = 1;
    group.fillMode = kCAFillModeForwards;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0, 0);
    transform = CGAffineTransformRotate(transform, fromDegree);
    self.imageView.layer.affineTransform = transform;
    
    [self.imageView.layer addAnimation:group forKey:nil];
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}

@end
