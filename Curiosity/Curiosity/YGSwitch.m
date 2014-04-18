//
//  YGSwitch.m
//  PieChart
//
//  Created by Yuriy Granchenko on 20.01.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "YGSwitch.h"
#import <QuartzCore/QuartzCore.h>

@interface YGSwitch () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIView *containView;
@property (strong, nonatomic) UIView *thumbneilView;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation YGSwitch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.containView = [UIView new];
    self.containView.frame = (CGRect){{0,0},{self.width, self.height}};
    self.containView.layer.cornerRadius = self.height/2;
    [self addSubview:self.containView];
    
    self.thumbneilView = [UIView new];
    self.thumbneilView.frame = (CGRect){{SWITCH_PADDING, SWITCH_PADDING},
                                        {self.height - 2*SWITCH_PADDING, self.height - 2*SWITCH_PADDING}};
    self.thumbneilView.layer.cornerRadius = self.height/2 - SWITCH_PADDING;
    self.thumbneilView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.thumbneilView.layer.shadowOffset = (CGSize){0, 1};
    self.thumbneilView.layer.shadowRadius = SWITCH_PADDING;
    self.thumbneilView.layer.shadowOpacity = 1.0f;
    self.thumbneilView.backgroundColor = self.thumbneilColor;
    [self.containView addSubview:self.thumbneilView];
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapThumb:)];
    self.tapGestureRecognizer.delegate = self;
    [self.thumbneilView addGestureRecognizer:self.tapGestureRecognizer];
    
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panThumb:)];
    [self.thumbneilView addGestureRecognizer:self.panGestureRecognizer];
    
    self.isOn = NO;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
   
}

- (void)setThumbneilColor:(UIColor *)thumbneilColor {
    _thumbneilColor = thumbneilColor;
    self.thumbneilView.backgroundColor = _thumbneilColor;
}

- (BOOL)isOn {
    return self.thumbneilView.x > SWITCH_PADDING;
}

- (void)setIsOn:(BOOL)isOn {
    self.containView.backgroundColor =  (isOn) ? self.placeholderColor : OFF_STATE_BG_COLOR;
    self.thumbneilView.origin = (isOn) ? (CGPoint){self.containView.width - self.containView.height + SWITCH_PADDING, SWITCH_PADDING} :
                                         (CGPoint){SWITCH_PADDING, SWITCH_PADDING};
}

- (void)tapThumb:(UITapGestureRecognizer *)tapGestureRecognizer {
    self.isOn = !self.isOn;
    self.thumbneilView.width -= 5.0f;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)panThumb:(UIPanGestureRecognizer *)panGestureTecognizer {
    if (panGestureTecognizer.state == UIGestureRecognizerStateBegan)
    {
        CGPoint velPoint = [panGestureTecognizer velocityInView:self.containView];
        if (velPoint.x > self.thumbneilView.x) {
            self.isOn = YES;
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        } else {
            self.isOn = NO;
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
        self.thumbneilView.width -= 5.0f;
    }
}

- (void)stretchEffect {
    [UIView animateWithDuration:.33f animations:^{
        self.thumbneilView.frame = (self.isOn) ? (CGRect){{self.thumbneilView.x - 5, self.thumbneilView.y},{self.thumbneilView.width + 5, self.thumbneilView.height}}:
                                                 (CGRect){{self.thumbneilView.x, self.thumbneilView.y},{self.thumbneilView.width + 5, self.thumbneilView.height}};
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    [self stretchEffect];
    return YES;
}

@end
