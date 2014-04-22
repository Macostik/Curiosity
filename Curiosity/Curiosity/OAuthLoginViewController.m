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
	CachingAppToken *tokenCaching;
	
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
	placeholderImageView.image = [blurImage applyBlurWithRadius:12.0 tintColor:tintColor saturationDeltaFactor:0.7 maskImage:nil];
	
	placeholderImageView.frame = CGRectInset(self.view.frame, -50.f, -100.f);
	[self addMotionEffectToView:placeholderImageView magnitude:50];
}

- (void)addMotionEffectToView:(UIView*)view  magnitude:(float)magnitude {
    UIInterpolatingMotionEffect* xMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xMotion.minimumRelativeValue = @(-magnitude);
    xMotion.maximumRelativeValue = @(magnitude);
    
    UIInterpolatingMotionEffect* yMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yMotion.minimumRelativeValue = @(-magnitude);
    yMotion.maximumRelativeValue = @(magnitude);
    
    UIMotionEffectGroup* group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xMotion, yMotion];
    
    [view addMotionEffect:group];
}

-(IBAction)login:(id)sender {
	[self openSessionWithAllowLoginUI:YES];
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
            if (!error) {
				[FBRequestConnection startWithGraphPath:@"/me/friends"
											 parameters:nil
											 HTTPMethod:@"GET"
									  completionHandler:^(
														  FBRequestConnection *connection,
														  id result,
														  NSError *error
														  ) {
										  /* handle the result */
									  }];
            }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            [FBSession.activeSession closeAndClearTokenInformation];
            break;
        default:
            break;
    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    BOOL openSessionResult = NO;
	
    if (!tokenCaching) {
        tokenCaching = [[CachingAppToken alloc] init];
        [tokenCaching setThirdPartySessionId:@"55555555"];
    }
	
    FBSession *session = [[FBSession alloc] initWithAppID:nil
                                              permissions:kRequestedPermissions
                                          urlSchemeSuffix:nil
                                       tokenCacheStrategy:tokenCaching];
    if (allowLoginUI || session.state == FBSessionStateCreatedTokenLoaded) {
        if (session.state == FBSessionStateCreatedTokenLoaded) {
            NSLog(@"Cached token found.");
        }
        [FBSession setActiveSession:session];
   
        [session openWithBehavior:FBSessionLoginBehaviorWithFallbackToWebView
                completionHandler:^(FBSession *session,
                                    FBSessionState state,
                                    NSError *error) {
                    [self sessionStateChanged:session
                                        state:state
                                        error:error];
                }];
 
        openSessionResult = session.isOpen;
    }
    return openSessionResult;
}

- (void) closeSession {
    [FBSession.activeSession closeAndClearTokenInformation];
}


@end
