//
//  UIResponder+YGFirstResponder.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "UIResponder+YGFirstResponder.h"
#import <objc/runtime.h>

static char *FirstResponderKey;

@implementation UIResponder (YGFirstResponder)

- (id)currentFirstResponder {
	[UIApplication.sharedApplication sendAction:@selector(findFirstResponder:)
											 to:nil from:self forEvent:nil];
	id obj = objc_getAssociatedObject(self, FirstResponderKey);
	objc_setAssociatedObject(self, FirstResponderKey, nil, OBJC_ASSOCIATION_ASSIGN);
	return obj;
}

- (void)setCurrentFirstResponder:(id)responder {
	objc_setAssociatedObject(self, FirstResponderKey, responder,
							 OBJC_ASSOCIATION_ASSIGN);
}

- (void)findFirstResponder:(id)sender {
	[sender setCurrentFirstResponder:self];
}

@end
