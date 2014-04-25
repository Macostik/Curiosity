//
//  FriendsModel.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 24.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "JSONModel.h"

@interface FriendsModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSURL *link;
@property (strong, nonatomic) NSURL *thumbnail;

@end
