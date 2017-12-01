//
//  ScrollViewController.m
//  TestMJ
//
//  Created by weiman on 2017/11/28.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "ScrollViewController.h"
#import "CustomView.h"

@interface ScrollViewController ()

@property(nonatomic,strong)UIScrollView * scrollView;
//滑动手势
@property(nonatomic,strong)UIPanGestureRecognizer * pan;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:view];
    
    [self initScrollView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, self.view.frame.size.height-110)];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake( self.view.frame.size.width-20, self.view.frame.size.height-100);
    
    //添加状态
    CustomView * customV = [[CustomView alloc] initWithFrame:CGRectMake(0, -64, self.scrollView.frame.size.width, 64)];
    [self.scrollView addSubview:customV];
    
    //在scrollview上添加一个图片
    UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"suolong"]];
    [self.scrollView addSubview:imageV];
    imageV.frame = CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    
    //scrollview添加监听
    [self addObserver];
}

-(void)addObserver{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:@"contentSize" options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:@"contentInset" options:options context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:@"state" options:options context:nil];
    
}

-(void)removeObserver{
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [self.scrollView removeObserver:self forKeyPath:@"contentSize"];
    [self.scrollView removeObserver:self forKeyPath:@"contentInset"];
    [self.pan removeObserver:self forKeyPath:@"state"];
    self.pan = nil;
}

#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"-----------------  %@------ %@",keyPath,change);
}

-(void)dealloc{

    [self removeObserver];
    NSLog(@"------------ScrollViewController 销毁了  ");
}


@end
