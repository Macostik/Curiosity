//
//  AboutMeModel.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 28.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "JSONModel.h"

@interface AboutMeModel : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString *first_name;
@property (strong, nonatomic) NSString *last_name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *gender;

@end
