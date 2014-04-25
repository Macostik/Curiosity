//
//  BaseTableViewController.h
//  Curiosity
//
//  Created by Yuriy Granchenko on 23.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

- (id)fillContentTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath;

@end
