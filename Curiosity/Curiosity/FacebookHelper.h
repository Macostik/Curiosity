//
//  FacebookHelper.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 23.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionHandler)(FBRequestConnection *connection, id result, NSError *error);

@interface FacebookHelper : NSObject

+(void)friendList:(CompletionHandler)completionHandler;

@end
