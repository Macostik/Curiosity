//
//  UIView+YGQuickFrame.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "UIView+YGQuickFrame.h"

@implementation UIView (YGQuickFrame)

#pragma mark - Setters methods

- (void)setSize:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
	CGSize size = self.size;
	size.width = width;
	self.size = size;
}

- (void)setHeight:(CGFloat)height {
	CGSize size = self.size;
	size.height = height;
	self.size = size;
}

- (void)setOrigin:(CGPoint)origin {
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (void)setX:(CGFloat)x {
	CGPoint origin = self.origin;
	origin.x = x;
	self.origin = origin;
}

- (void)setY:(CGFloat)y {
	CGPoint origin = self.origin;
	origin.y = y;
	self.origin = origin;
}

#pragma mark - Getters methods

- (CGSize)size {
	return self.frame.size;
}

- (CGFloat)width {
	return self.size.width;
}

- (CGFloat)height {
	return self.size.height;
}

- (CGPoint)origin {
	return self.frame.origin;
}

- (CGFloat)x {
	return self.origin.x;
}

- (CGFloat)y {
	return self.origin.y;
}

- (CGPoint)topLeft {
	return CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame));
}

- (CGPoint)topRight {
	return CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
}

- (CGPoint)bottomRight {
	return CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame));
}

- (CGPoint)bottomLeft {
	return CGPointMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame));
}


@end
