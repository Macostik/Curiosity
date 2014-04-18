//
//  UIView+YGQuickFrame.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YGQuickFrame)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGPoint)bottomRight;
- (CGPoint)bottomLeft;


@end
