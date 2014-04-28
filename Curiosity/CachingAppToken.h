//
//  CachingAppToken.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 22.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import <FacebookSDK/FBSessionTokenCachingStrategy.h>

@interface CachingAppToken : FBSessionTokenCachingStrategy

+ (instancetype)instance;
+ (NSDictionary *)readData;
+ (void)writeData:(NSDictionary *)data;
- (FBAccessTokenData *)fetchFBAccessTokenData;

@end
