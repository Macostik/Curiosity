//
//  FriendTableViewCell.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 24.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface FriendTableViewCell : BaseTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (strong, nonatomic) IBOutlet YGLabel *id_Label;
@property (strong, nonatomic) IBOutlet YGLabel *nameLabel;

@end

