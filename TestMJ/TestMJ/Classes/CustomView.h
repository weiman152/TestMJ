//
//  CustomView.h
//  TestMJ
//
//  Created by weiman on 2017/12/1.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MyRefreshNormal       @"好孩子，开始刷新吧"
#define MyRefreshPull         @"松开可以刷新哟"
#define MyRefreshRefreshing   @"老板，正在努力加载中......"
#define MyRefreshEnd          @"活干完啦，老板，发个工资呗"

typedef enum MyRefreshType{
    MyRefreshTypeNormal,
    MyRefreshTypePull,
    MyRefreshTypeRefreshing,
    MyRefreshTypeEnd
}MyRefreshType;

@interface CustomView : UIView



@end
