//
//  OAuthLoginViewController.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "OAuthLoginViewController.h"
#import "CachingAppToken.h"

@interface OAuthLoginViewController () {
	IBOutlet UIImageView *placeholderImageView;
	IBOutlet UIButton *loginButton;
	CachingAppToken *tokenCaching;
	FBSession *fbSession;
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
	
	UIImage *blurImage = [UIImage imageNamed:@"Logo"];
	UIColor *tintColor = [UIColor colorWithRed:20/255.0f green:70/255.0f blue:200/255.0f alpha:0.2f];
	placeholderImageView.image = [blurImage applyBlurWithRadius:5.0f
													  tintColor:tintColor
										  saturationDeltaFactor:0.9f
													  maskImage:nil];
	
	placeholderImageView.frame = CGRectInset(placeholderImageView.frame, -20.f, -20.0f);
	[self addMotionEffectToView:placeholderImageView magnitude:20];
	
	loginButton.layer.cornerRadius = 7.0f;
	loginButton.layer.borderWidth = 1.0f;
	loginButton.layer.borderColor = loginButton.titleLabel.textColor.CGColor;
	
	loginButton.alpha = .0f;
	loginButton.transform = CGAffineTransformTranslate(loginButton.transform, 0, CGRectGetMaxY(self.view.frame));
	
	[UIView animateWithDuration:.5f
						  delay:.33f
		 usingSpringWithDamping:.4f
		  initialSpringVelocity:.0f
						options:UIViewAnimationOptionCurveLinear
					 animations:^{
						 loginButton.alpha = 1.0f;
						 loginButton.transform = CGAffineTransformIdentity;
	} completion:nil];
}

- (void)addMotionEffectToView:(UIView*)view  magnitude:(float)magnitude {
    UIInterpolatingMotionEffect* xMotion = [[UIInterpolatingMotionEffect alloc]
											initWithKeyPath:@"center.x"
											type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xMotion.minimumRelativeValue = @(-magnitude);
    xMotion.maximumRelativeValue = @(magnitude);
    
    UIInterpolatingMotionEffect* yMotion = [[UIInterpolatingMotionEffect alloc]
											initWithKeyPath:@"center.y"
											type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yMotion.minimumRelativeValue = @(-magnitude);
    yMotion.maximumRelativeValue = @(magnitude);
    
    UIMotionEffectGroup* group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xMotion, yMotion];
    
    [view addMotionEffect:group];
}

#pragma mark - Login Facebook

-(IBAction)login:(id)sender {
	[self openSessionWithAllowLoginUI:YES];
}

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {

#if TARGET_IPHONE_SIMULATOR
    if (!tokenCaching) {
        tokenCaching = [[CachingAppToken alloc] init];
    }

	fbSession = [[FBSession alloc] initWithAppID:nil
                                              permissions:kRequestedPermissions
                                          urlSchemeSuffix:nil
                                       tokenCacheStrategy:tokenCaching];
	
    if (allowLoginUI || fbSession.state == FBSessionStateCreatedTokenLoaded) {
        if (fbSession.state == FBSessionStateCreatedTokenLoaded) {
            YGLog(@"Cached token found.");
        }
        [FBSession setActiveSession:fbSession];
		
        [fbSession openWithBehavior:FBSessionLoginBehaviorWithFallbackToWebView
				  completionHandler:^(FBSession *session,FBSessionState state, NSError *error) {
					  [self sessionStateChanged:session
										  state:state
										  error:error];
				  }];
    }
#else
	if (FBSession.activeSession.state == FBSessionStateOpen
		|| FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
		[self closeSession];
	} else if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
		[CachingAppToken writeData:[[[FBSession activeSession] accessTokenData] dictionary]];
		[self sessionStateChanged:FBSession.activeSession state:FBSession.activeSession.state error:nil];
	} else {
		[[FBSession activeSession] openWithBehavior:FBSessionLoginBehaviorWithFallbackToWebView
								  completionHandler:^(FBSession *session, FBSessionState state, NSError *error)  {
									  [self sessionStateChanged:session state:state error:error];
								  }];
	}
#endif
    return fbSession.isOpen;
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
		case FBSessionStateCreatedTokenLoaded:
            if (!error) {
				UIViewController *initViewController = [AppDelegate initViewController:kTabBarControlIdentity];
				[[[UIApplication sharedApplication] keyWindow] setRootViewController:initViewController];
            }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            [self closeSession];
            break;
        default:
            break;
    }
    if (error) {
		[[[UIAlertView alloc]initWithTitle:@"Error"
								   message:error.localizedDescription
								  delegate:nil
						 cancelButtonTitle:@"OK"
						 otherButtonTitles:nil] show];
    }
}

- (void)closeSession {
    [FBSession.activeSession closeAndClearTokenInformation];
}

@end
