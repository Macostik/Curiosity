//
//  AboutMeViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 28.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "AboutMeViewController.h"
#import "FacebookHelper.h"
#import "AboutMeModel.h"

@interface AboutMeViewController () {
	IBOutlet UIImageView *thumbnailImage;
	IBOutlet YGLabel *nameLable;
}

@end

@implementation AboutMeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self fetchInfoAboutMe];
}

- (void)fetchInfoAboutMe {
	[FacebookHelper aboutMe:^(FBRequestConnection *connection, id result, NSError *error) {
		NSError *initError = nil;
		NSDictionary *resultDictionary = (NSDictionary *)result;
		AboutMeModel *aboutMeModel = [[AboutMeModel alloc] initWithDictionary:resultDictionary error:&initError];
		if(aboutMeModel && !initError) {
			dispatch_async(dispatch_get_main_queue(), ^{
				thumbnailImage.image = [UIImage imageNamed:@"iAm"];
				nameLable.text = [NSString stringWithFormat:aboutMeModel.first_name, aboutMeModel.last_name];
			});
		}
	}];
}
@end
