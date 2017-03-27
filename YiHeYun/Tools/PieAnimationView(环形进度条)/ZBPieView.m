//
//  ZBPieView.m
//  ZBPieAnimationView
//
//  Created by zhanbing han on 17/3/26.
//  Copyright © 2017年 cydf. All rights reserved.
//

#import "ZBPieView.h"
#import "UILabel+PPCounter.h"

#define LINE_WIDTH 10//环形宽度
#define DURATION 1.0//动画时间
#define TEXT_FONT 8.f

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ZBPieView()

@property (nonatomic,assign) float      percent;
@property (nonatomic,assign) float      radius;
@property (nonatomic,assign) CGPoint    centerPoint;
@property (nonatomic,strong) UIColor    *lineColor;

@property (nonatomic,strong) CAShapeLayer *lineLayer;

@end

@implementation ZBPieView

-(instancetype)initWithFrame:(CGRect)frame andPercent:(float)percent andColor:(UIColor *)color{
    if(self = [super initWithFrame:frame]) {
        self.percent = percent;
        self.radius = CGRectGetWidth(frame) / 2.0 - LINE_WIDTH / 2.0;
        self.lineColor = color;
        self.centerPoint = CGPointMake(CGRectGetWidth(frame) / 2.0, CGRectGetWidth(frame) / 2.0);
        [self createBackLine];
        [self commonInit];
    }
    return self;
}

-(void)setPercent:(float)percent {
    if (percent >= 1) {
        _percent = 1;
    }else {
        _percent = percent;
    }
}

-(void)reloadViewWithPercent:(float)percent {
    self.percent = percent;
    [self.layer removeAllAnimations];
    [self.lineLayer removeFromSuperlayer];
    [self commonInit];
}

-(void)commonInit {
    [self createPercentLayer];
}

-(void)createBackLine {
    //绘制背景
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 2.5;
    shapeLayer.strokeColor = [[UIColor colorWithRed:0.369 green:0.322 blue:0.424 alpha:1.000] CGColor];
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    UIBezierPath *path = [UIBezierPath new];
    [path addArcWithCenter:self.centerPoint radius:self.radius startAngle:-M_PI / 2.0 endAngle:M_PI / 2 * 3 clockwise:YES];
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
}

-(void)createPercentLayer {
    //绘制环形
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.lineWidth = 2.5;
    self.lineLayer.lineCap = kCALineCapRound;
    self.lineLayer.strokeColor = [self.lineColor CGColor];
    self.lineLayer.fillColor = [[UIColor clearColor] CGColor];
    
    UIBezierPath *path = [UIBezierPath new];
    [path addArcWithCenter:self.centerPoint radius:self.radius startAngle:-M_PI / 2.0 endAngle:M_PI * 2 * self.percent - M_PI / 2.0 clockwise:YES];
    self.lineLayer.path = path.CGPath;
    CABasicAnimation *showAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    showAnimation.fromValue = @0;
    showAnimation.toValue = @1;
    showAnimation.duration = DURATION;
    showAnimation.removedOnCompletion = YES;
    showAnimation.fillMode = kCAFillModeForwards;
    [self.layer addSublayer:self.lineLayer];
    [self.lineLayer addAnimation:showAnimation forKey:@"kClockAnimation"];
}

@end
