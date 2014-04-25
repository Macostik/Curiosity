//
//  FriendsModel.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 24.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"picture.data.url":@"thumbnail"}];
}

@end
