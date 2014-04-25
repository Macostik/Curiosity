
//  FriendsViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendTableViewCell.h"
#import "FacebookHelper.h"
#import "FriendsModel.h"

@interface FriendsViewController () {
	NSArray *friendsArray;
	FriendsModel *friendsModel;
}

@end

@implementation FriendsViewController

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self allFriend];
	[HUD showUIBlockingIndicatorWithText:@"Loading..."];
	
	if ([self.tableView respondsToSelector:@selector(separatorInset)]) {
		self.tableView.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0);
		self.tableView.separatorColor = kBaseColor;
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
}

#pragma mark - UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [friendsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	static FriendTableViewCell *cell;
	if (cell == nil) {
		cell = [tableView dequeueReusableCellWithIdentifier:@"friendsCell"];
	}
	[self fillContentTableView:tableView withIndexPath:indexPath];
	return [cell heightForRowAtIndexPath:indexPath];
}

- (id)fillContentTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *identifier = @"friendsCell";
    FriendTableViewCell *friendcell = [tableView dequeueReusableCellWithIdentifier:identifier];
	
	friendsModel = friendsArray[indexPath.row];
	friendcell.nameLabel.textColor = kBaseColor;
	friendcell.nameLabel.text  = friendsModel.name;
	friendcell.linkLabel.text = friendsModel.link.absoluteString;
	friendcell.linkLabel.textColor = kBaseColor;
	[friendcell.thumbnailImageView setImageWithURL:friendsModel.thumbnail];
	
	return friendcell;
}

#pragma mark - Content data

- (void)refreshDataContent {
	[self allFriend];
}

- (void)allFriend {
	
	[FacebookHelper friendList:^(FBRequestConnection *connection, NSDictionary *result, NSError *error) {
		if (!error) {
			dispatch_async(dispatch_get_main_queue(), ^{
				friendsArray = [FriendsModel arrayOfModelsFromDictionaries:result[@"data"]];
				[HUD hideUIBlockingIndicator];
				[self.tableView reloadData];
			});
		}
	}];
}

@end
