
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [friendsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"friendsCell";
    FriendTableViewCell *friendcell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!friendcell) {
        friendcell = [[FriendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
	friendsModel = friendsArray[indexPath.row];
	friendcell.id_Label.text = [NSString stringWithFormat:@"%i", friendsModel.id];
	friendcell.nameLabel.text = friendsModel.name;
	
    return friendcell;
}

- (void)refreshDataContent {
	[self allFriend];
}

- (void)allFriend {
	[FacebookHelper friendList:^(FBRequestConnection *connection, NSDictionary *result, NSError *error) {
		if (!error) {
			friendsArray = [FriendsModel arrayOfModelsFromDictionaries:result[@"data"]];
			dispatch_async(dispatch_get_main_queue(), ^{
				[self.tableView reloadData];
			});
		}
	}];
}

@end
