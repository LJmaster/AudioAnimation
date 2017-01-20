//
//  XTActivityView.h
//  histogramAnimation
//
//  Created by liujie on 16/9/23.
//  Copyright © 2016年 liujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTActivityView : UIView{

    UIView * rView;

}

/// 方块的个数
//@property (nonatomic,assign)int numberOfRect;
//
//@property (nonatomic,strong)UIColor * rectBackgroundColor;
//
//@property (nonatomic,assign)CGSize defaultSize;
//
//@property (nonatomic,assign)CGFloat space;

-(instancetype)initWithFrame:(CGRect)frame NumberOfRect:(int)numberOfRect RectBackgroundColor:(UIColor *)rectBackgroundColor Space:(CGFloat)space DefaultSize:(CGSize)defaultSize;

//开始动画
-(void)startAnimation;
//停止动画
-(void)stopAnimation;


@end
