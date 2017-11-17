//
//  CustomHeader.m
//  TestMJ
//
//  Created by weiman on 2017/11/17.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "CustomHeader.h"

@interface CustomHeader()

@property(nonatomic,weak)UILabel * stateLabel;
@property(nonatomic,weak)UIImageView * imageV;
@property(nonatomic,weak)UIActivityIndicatorView *loading;

@end

@implementation CustomHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
-(void)prepare{
    [super prepare];
    //设置控件的高度
    self.mj_h = 50;
    
    //添加label
    UILabel * label = [[UILabel alloc] init];
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.stateLabel = label;
    
    //图片
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageV.image = [UIImage imageNamed:@"refresh"];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageV];
    self.imageV = imageV;
    
    //loading
    UIActivityIndicatorView * loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:loading];
    self.loading = loading;
    
}

#pragma mark 在这里设置子控件的位置和尺寸
-(void)placeSubviews{
    [super placeSubviews];
    self.stateLabel.frame = self.bounds;
    self.imageV.frame = CGRectMake(50, self.mj_h*0.25, 30, 30);
    //self.imageV.center = CGPointMake(self.mj_w * 0.5, - self.imageV.mj_h + 20);
    self.loading.center = CGPointMake(self.mj_w-30, self.mj_h*0.5);
}

#pragma mark 监听scrollView的contentOffset改变
-(void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark - 监听scrollView的contentSize改变
-(void)scrollViewContentSizeDidChange:(NSDictionary *)change{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
-(void)scrollViewPanStateDidChange:(NSDictionary *)change{
    [super scrollViewPanStateDidChange:change];
}

#pragma mark - 监听控件的刷新状态
-(void)setState:(MJRefreshState)state{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
        {
            [self.loading stopAnimating];
            self.stateLabel.text = @"下拉哟，哟乎乎";
        }
            break;
        case MJRefreshStatePulling:
        {
            [self.loading stopAnimating];
            self.stateLabel.text = @"赶紧放开我吧";
        }
            break;
        case MJRefreshStateRefreshing:
        {
            self.stateLabel.text = @"数据加载中";
            [self.loading startAnimating];
        }
            break;
  
        default:
            break;
    }
}

#pragma mark - 监听拖拽比例（控件被拖出来的比例）
-(void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];
    
    CGFloat red = 1.0 - pullingPercent * 0.5;
    CGFloat green = 0.5 - 0.5 * pullingPercent;
    CGFloat blue = 0.5 * pullingPercent;
    self.stateLabel.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end






