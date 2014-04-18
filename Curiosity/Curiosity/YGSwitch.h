//
//  YGSwitch.h
//  PieChart
//
//  Created by Yuriy Granchenko on 20.01.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSwith_Padding 2
#define kOff_State_Bg_Color [UIColor blueColor]

@interface YGSwitch : UIControl

@property (strong, nonatomic) UIColor *placeholderColor;
@property (strong, nonatomic) UIColor *thumbneilColor;
@property (assign, nonatomic) BOOL isOn;

@end
