//
//  FriendsModel.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 24.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "JSONModel.h"

@interface FriendsModel : JSONModel

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) int id;

@end
