//
//  PFPlayStationLoadingView.h
//  PFPlayStationLoading
//
//  Created by Cee on 10/10/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PFPlayStationLoadingViewType) {
    PFPlayStationLoadingViewTypeHorizontal = 0,
    PFPlayStationLoadingViewTypeSquare
};

@interface PFPlayStationLoadingView : UIView

- (id)initWithFrame:(CGRect)frame sideLength:(CGFloat)length type:(PFPlayStationLoadingViewType)type;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

@end
