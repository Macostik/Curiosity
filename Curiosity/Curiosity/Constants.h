//
//  Constants.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#ifndef Curiosity_Constants_h
#define Curiosity_Constants_h

#if TARGET_IPHONE_SIMULATOR
#define JMLog( s, ... ) NSLog( @"[%@:%d] %@", [[NSString stringWithUTF8String:__FILE__] \
lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define JMLog( s, ... )
#endif

#define isSevenVersionSDK !(floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)

#define noInternetConnection ([[Reachability reachabilityForInternetConnection] isReachable] == NotReachable)

#define kAccessToken @"accessToken"

#endif
