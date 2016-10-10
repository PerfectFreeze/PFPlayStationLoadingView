//
//  PFPlayStationLoadingItem.h
//  PFPlayStationLoading
//
//  Created by Cee on 9/21/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PFPlayStationLoadingItemType) {
    PFPlayStationLoadingItemTypeCircle = 0,
    PFPlayStationLoadingItemTypeCross,
    PFPlayStationLoadingItemTypeRectangle,
    PFPlayStationLoadingItemTypeTriangle
};

@interface PFPlayStationLoadingItem : UIView

@property (nonatomic, assign) PFPlayStationLoadingItemType type;

- (id)initWithFrame:(CGRect)frame type:(PFPlayStationLoadingItemType)type;
- (void)startAnimationWithDelay:(NSTimeInterval)delay;

@end
