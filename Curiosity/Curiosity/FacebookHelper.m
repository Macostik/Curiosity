//
//  FacebookHelper.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 23.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "FacebookHelper.h"

@implementation FacebookHelper

-(id)init {
	if (self = [super init]) {
	}
	return self;
}

+ (instancetype)instance {
    static FacebookHelper *facebookHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        facebookHelper = [[self alloc] init];
    });
    
    return facebookHelper;
}

+ (void)friendList:(CompletionHandler)completionHandler {
	[FBRequestConnection startWithGraphPath:@"/me/friends?fields=name,gender,link,location,picture.height(120).width(120)"
								 parameters:nil
								 HTTPMethod:@"GET"
						  completionHandler:completionHandler];
}


@end
