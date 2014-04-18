//
//  OAuthLoginViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "OAuthLoginViewController.h"

@interface OAuthLoginViewController () {
	
	IBOutlet UIImageView *placeholderImageView;
	
}

@end

@implementation OAuthLoginViewController

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
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.navigationController.navigationBar.hidden = YES;
	UIImage *blurImage = [UIImage imageNamed:@"facebook_logo"];
	UIColor *tintColor = [UIColor colorWithRed:20/255.0f green:70/255.0f blue:200/255.0f alpha:0.2f];
	placeholderImageView.image = [blurImage applyBlurWithRadius:7 tintColor:tintColor saturationDeltaFactor:0.7 maskImage:nil];
}

@end
