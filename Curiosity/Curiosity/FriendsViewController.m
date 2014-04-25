
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

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
	[self allFriend];
	[HUD showUIBlockingIndicatorWithText:@"Loading..."];
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
	[self fillContentCell:cell withIndexPath:indexPath];
	return [cell heightForRowAtIndexPath:indexPath];
}

- (void)fillContentCell:(FriendTableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath {
	friendsModel = friendsArray[indexPath.row];
	cell.id_Label.text = [NSString stringWithFormat:@"%i", friendsModel.id];
	cell.nameLabel.text  = friendsModel.name;
	[cell.thumbnailImageView setImageWithURL:friendsModel.thumbnail];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"friendsCell";
    FriendTableViewCell *friendcell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
	
	[self fillContentCell:friendcell withIndexPath:indexPath];
	
    return friendcell;
}

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
