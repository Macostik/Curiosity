//
//  BaseViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () {
	UIImageView *backgroundView;
}

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
//	backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//	[self.view addSubview:backgroundView];
//	
//	UIColor *tintColor = [UIColor colorWithRed:30.0f/255.0f green:70/255.0f blue:140/255.0f alpha:0.2f];
//	UIImage *backgroundImage = [[UIImage imageNamed:@"PlaceholderMeImage"] applyBlurWithRadius:12 tintColor:tintColor saturationDeltaFactor:0.8 maskImage:nil];
//	backgroundView.image = backgroundImage;
//	
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
//	imageView.contentMode = UIViewContentModeScaleAspectFill;
//	imageView.clipsToBounds = YES;
//	imageView.alpha = 0.8f;
//	backgroundView = imageView;
}

@end
