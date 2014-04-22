//
//  CachingAppToken.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 22.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "CachingAppToken.h"

@implementation CachingAppToken {
	NSString *tokenFilePath;
}

- (id)init {
    self = [super init];
    if (self) {
        _thirdPartySessionId = @"";
    }
    return self;
}

#pragma FBTokenCachingStrategy override methods

- (void)cacheFBAccessTokenData:(FBAccessTokenData *)accessToken {
	[CachingAppToken writeData:[accessToken dictionary]];
}

- (FBAccessTokenData *)fetchFBAccessTokenData {
    if ([CachingAppToken readData]) {
        return nil;
    } else {
        return [FBAccessTokenData createTokenFromDictionary:@{}.mutableCopy];
    }
}

- (void)clearToken {
	[CachingAppToken writeData:@{}.mutableCopy];
}

#pragma mark - Local caching helper methods
+ (NSString *)cachingFilePath {
	return [kApplicationDocumentsDirectory stringByAppendingPathComponent:kFilename];
}

+ (void)writeData:(NSDictionary *)data {
    if (![data writeToFile:[CachingAppToken cachingFilePath] atomically:YES]) {
        NSLog(@"Error writing to file");
    }
}

+ (NSDictionary *)readData {
    return [[NSDictionary alloc] initWithContentsOfFile:[CachingAppToken cachingFilePath]];
}

@end
