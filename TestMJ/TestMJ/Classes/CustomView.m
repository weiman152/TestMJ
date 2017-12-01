//
//  CustomView.m
//  TestMJ
//
//  Created by weiman on 2017/12/1.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()
//状态信息
@property(nonatomic,strong)UILabel * stateLabel;
//时间信息
@property(nonatomic,strong)UILabel * timeLabel;

@end

@implementation CustomView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews{
    //状态
    [self addSubview:self.stateLabel];
    self.stateLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2.0);
    self.stateLabel.backgroundColor = [UIColor yellowColor];
    self.stateLabel.text = MyRefreshNormal;
    self.stateLabel.textAlignment = NSTextAlignmentCenter;
    self.stateLabel.font = [UIFont systemFontOfSize:15];
    
    //时间
    [self addSubview:self.timeLabel];
    self.timeLabel.frame = CGRectMake(0, self.frame.size.height/2.0, self.frame.size.width, self.frame.size.height/2.0);
    self.timeLabel.backgroundColor = [UIColor redColor];
    self.timeLabel.text = [self getTimeNow];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = [UIFont systemFontOfSize:14];
}

-(NSString *)getTimeNow{
    NSDate * date = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//东八区时间
    NSString * currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}

-(UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] init];
    }
    return _stateLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}

@end
