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
#define YGLog( s, ... ) NSLog( @"[%@:%d] %@", [[NSString stringWithUTF8String:__FILE__] \
lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define YGLog( s, ... ) NSLog( @"%@", [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#endif

#define isSevenVersionSDK !(floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
#define noInternetConnection ([[Reachability reachabilityForInternetConnection] isReachable] == NotReachable)
#define kApplicationDocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define kAccessTokenKey @"com.facebook.sdk:TokenInformationTokenKey"
#define kRequestedPermissions @[@"basic_info", @"user_birthday"]
#define kFilename @"TokenInfo.plist"
#define kTabBarControlIdentity @"TabBarID"
#define kLogControlIdentity @"LoginID"
#define kBaseColor [UIColor colorWithRed:34.0f/255.0f green:201.0f/255.0f blue:238.0f/255.0f alpha:1.0f]

#endif
