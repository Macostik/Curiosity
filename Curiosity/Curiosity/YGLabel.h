//
//  YGLabel.h
//  PieChart
//
//  Created by Yuriy Granchenko on 26.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, VerticalAlignment) {
    VerticalAlignmentTop      = 0,
    VerticalAlignmentMiddle   = 1 << 0,
    VerticalAlignmentBottom   = 1 << 1,
};

@interface YGLabel : UILabel

@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
