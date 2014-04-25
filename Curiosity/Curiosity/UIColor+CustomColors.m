//
//  UIColor+CustomColors.m
//  Riot
//
//  Created by Sergey Maximenko on 06.09.12.
//
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)pic_DarkGrayColor
{
    return [UIColor pic_GrayColorWithValue:51.0f];
}

+ (UIColor *)pic_GrayColor
{
    return [UIColor pic_GrayColorWithValue:102.0f];
}

+ (UIColor *)pic_LightGrayColor
{
    return [UIColor pic_GrayColorWithValue:204.0f];
}

+ (UIColor *)pic_BackgroundGrayColor
{
    return [UIColor pic_GrayColorWithValue:233.0f];
}

+ (UIColor *)pic_BackgroundWhiteColor
{
    return [UIColor pic_GrayColorWithValue:251.0f];
}

+ (UIColor *)pic_GrayColorWithValue:(CGFloat)value
{
    return [UIColor colorWithRed:value/255.0f green:value/255.0f blue:value/255.0f alpha:1.0f];
}

+ (UIColor *)pic_BackgroundPatternColor
{
    return [UIColor colorWithRed:223.0f/255.0f green:225.0f/255.0f blue:232.0f/255.0f alpha:1.0f];
}

+ (UIColor *)r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}

@end
