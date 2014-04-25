//
//  UIColor+CustomColors.h
//  Riot
//
//  Created by Sergey Maximenko on 06.09.12.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (CustomColors)

+ (UIColor*)pic_DarkGrayColor;
+ (UIColor*)pic_GrayColor;
+ (UIColor*)pic_LightGrayColor;
+ (UIColor*)pic_BackgroundGrayColor;
+ (UIColor*)pic_BackgroundWhiteColor;

+ (UIColor*)pic_GrayColorWithValue:(CGFloat)value;
+ (UIColor*)r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;

+ (UIColor*)pic_BackgroundPatternColor;

@end
