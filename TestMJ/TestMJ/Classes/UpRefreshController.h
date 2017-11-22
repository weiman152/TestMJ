//
//  UpRefreshController.h
//  TestMJ
//
//  Created by weiman on 2017/11/17.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum UpRefreshType{
    UpRefreshTypeNone,
    UpRefreshTypeBack,
    UpRefreshTypeBackGif,
    UpRefreshTypeBackState,
    UpRefreshTypeBackNormal,
    UpRefreshTypeAuto,
    UpRefreshTypeAutoGif,
    UpRefreshTypeAutoState,
    UpRefreshTypeAutoNormal,
    UpRefreshTypeAnimationCustom,
    UpRefreshTypeAnimationGif

}UpRefreshType;


@interface UpRefreshController : UIViewController

//footer刷新的类型
@property(nonatomic,assign)UpRefreshType type;

@end
