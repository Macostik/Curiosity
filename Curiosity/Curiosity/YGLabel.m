//
//  YGLabel.m
//  PieChart
//
//  Created by Yuriy Granchenko on 26.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "YGLabel.h"

@implementation YGLabel

- (id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.verticalAlignment = VerticalAlignmentTop;
}

- (CGRect)textRectForBounds:(CGRect)bounds
    limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds
                    limitedToNumberOfLines:numberOfLines];
    CGRect result;
    switch (self.verticalAlignment)
    {
        case VerticalAlignmentTop:
            result = (CGRect){{rect.origin.x, bounds.origin.y},{rect.size.width, rect.size.height}};
            break;
        case VerticalAlignmentMiddle:
            result = (CGRect){{rect.origin.x,  bounds.origin.y + (bounds.size.height - rect.size.height)/2},{rect.size.width, rect.size.height}};
            break;
        case VerticalAlignmentBottom:
            result = (CGRect){{rect.origin.x,  bounds.origin.y + (bounds.size.height - rect.size.height)},{rect.size.width, rect.size.height}};
            break;
        default:
            result = bounds;
            break;
    }
    
    return result;
}

- (void)drawTextInRect:(CGRect)rect {
    CGRect frame = [self textRectForBounds:rect
                limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:frame];
}

@end
