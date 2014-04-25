//
//  FriendTableViewCell.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 24.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib {
	self.thumbnailImageView.layer.cornerRadius = self.thumbnailImageView.width/2;
//	self.thumbnailImageView.layer.borderWidth = 2.0f;
	self.thumbnailImageView.layer.borderColor = kBaseColor.CGColor;
	self.thumbnailImageView.layer.masksToBounds = YES;
	self.thumbnailImageView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
	self.thumbnailImageView.layer.shadowOffset = CGSizeMake(2, 2);
	self.thumbnailImageView.layer.shadowOpacity = 1.0f;
}

@end
