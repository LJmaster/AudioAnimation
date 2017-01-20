//
//  XTActivityView.m
//  histogramAnimation
//
//  Created by liujie on 16/9/23.
//  Copyright © 2016年 liujie. All rights reserved.
//

#import "XTActivityView.h"

@interface XTActivityView ()<CAAnimationDelegate>

@end

@implementation XTActivityView


-(instancetype)initWithFrame:(CGRect)frame NumberOfRect:(int)numberOfRect RectBackgroundColor:(UIColor *)rectBackgroundColor Space:(CGFloat)space DefaultSize:(CGSize)defaultSize {

    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i <numberOfRect; i++) {
            CGFloat x = i * (4 + space);
            rView = [[UIView alloc] initWithFrame:CGRectMake(x, 0, 2, 0)];
            rView.backgroundColor  =rectBackgroundColor;
            [rView.layer setAnchorPoint:CGPointMake(0, 1)];
            rView.layer.bounds = CGRectMake(0, 0, 2, defaultSize.height);
            rView.layer.position = CGPointMake(x, defaultSize.height);
            rView.layer.frame = rView.frame;
            
            [rView.layer addAnimation:[self addAnimateWithDelay:(double)(0) withI:i] forKey:@"bounds"];
            [self addSubview:rView];
            
        }
    }
    return self;
}


-(CABasicAnimation *)addAnimateWithDelay:(double )delay withI:(int)i{

    CABasicAnimation * animation =[CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    animation.autoreverses = YES;
    animation.delegate = self;
    animation.repeatCount = HUGE_VALF;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    if (i == 0) {
        animation.fromValue = [[NSNumber alloc] initWithFloat:0.25];
        animation.toValue = [[NSNumber alloc] initWithFloat:0.75];
        
    }
    if (i == 1) {
        animation.fromValue = [[NSNumber alloc] initWithFloat:1];
        animation.toValue = [[NSNumber alloc] initWithFloat:0.5];
    }
    if (i == 2) {
        animation.fromValue = [[NSNumber alloc] initWithFloat:0.5];
        animation.toValue = [[NSNumber alloc] initWithFloat:1];
    }
    if (i == 3) {
        animation.fromValue = [[NSNumber alloc] initWithFloat:0.75];
        animation.toValue = [[NSNumber alloc] initWithFloat:0.25];
    }
    
    animation.duration = 1.0;
    animation.beginTime = CACurrentMediaTime()+delay;

    return animation;
}

-(void)startAnimation{
    [self resumeLayer:self.layer];
}
-(void)stopAnimation{
    [self pauseLayer:self.layer];
}


//暂停layer上面的动画
- (void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续layer上面的动画

- (void)resumeLayer:(CALayer*)layer
{
    
    [self pauseLayer:layer];
    
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}



@end
