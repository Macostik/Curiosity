//
//  BaseTableViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 23.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController () {
	UIRefreshControl *refreshControll;
}

@end

@implementation BaseTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
#ifdef __IPHONE_7_0
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout &= ~UIRectEdgeTop;
    }
#endif
	UIColor *tintColor = [UIColor colorWithRed:140/255.0f green:70/255.0f blue:35/255.0f alpha:0.2f];
	UIImage *backgroundImage = [[UIImage imageNamed:@"PlaceholderImage"] applyBlurWithRadius:5 tintColor:tintColor saturationDeltaFactor:0.8 maskImage:nil];
	
	UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.clipsToBounds = YES;
	imageView.alpha = 0.8f;
	self.tableView.backgroundView = imageView;
	
	refreshControll = [[UIRefreshControl alloc] init];
    [refreshControll addTarget:self
                            action:@selector(refreshData)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControll];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self fillContentTableView:tableView withIndexPath:indexPath];;
}

- (id)fillContentTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)refreshData {
	[self refreshDataContent];
	[refreshControll endRefreshing];
}

-(void)refreshDataContent {	
}

@end
