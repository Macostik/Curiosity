//
//  BaseViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
}

@end
