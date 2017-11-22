//
//  CustomFooter.m
//  TestMJ
//
//  Created by weiman on 2017/11/22.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "CustomFooter.h"

@implementation CustomFooter

//重写方法
-(void)prepare{
    [super prepare];
    
    //设置正在刷新状态的动画图片
    NSMutableArray * refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd",i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}

@end
