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

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
#ifdef __IPHONE_7_0
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout &= ~UIRectEdgeTop;
    }
#endif
	
	refreshControll = [[UIRefreshControl alloc] init];
    [refreshControll addTarget:self
                            action:@selector(refreshData)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)refreshData {
	[self refreshDataContent];
	[refreshControll endRefreshing];
}

-(void)refreshDataContent {
	
}

@end
