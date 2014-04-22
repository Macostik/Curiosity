//
//  OAuthLoginViewController.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CompletionBlock)(NSData *data, NSURLResponse *response, NSError *error);

@interface OAuthLoginViewController : BaseViewController

@property (strong, nonatomic) CompletionBlock completionBlock;

@end
