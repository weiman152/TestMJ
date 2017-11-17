//
//  DownDefaultController.h
//  TestMJ
//
//  Created by weiman on 2017/11/17.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum RefreshType{
    RefreshTypeDownDefault,//MJRefreshHeader
    RefreshTypeDownAnimation,
    RefreshTypeDownHideTime,
    RefreshTypeDownHideState,
    RefreshTypeDownCustomText,
    RefreshTypeDownCustomRefreshUI
}RefreshType;

@interface DownDefaultController : UIViewController
//类型
@property(nonatomic,assign)RefreshType type;

@end
