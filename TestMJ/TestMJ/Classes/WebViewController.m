//
//  WebViewController.m
//  TestMJ
//
//  Created by weiman on 2017/11/28.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "WebViewController.h"
#import "MJRefresh.h"

@interface WebViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView * webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWebView];
    [self addRefreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initWebView{
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    self.webView.delegate = self;
}

-(void)addRefreshUI{
    
    __weak WebViewController * weakS = self;
   self.webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakS.webView  reload];
    }];
    
    self.webView.scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakS.webView  reload];
    }];
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView{

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView.scrollView.mj_header endRefreshing];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"----------  %@",request.URL.absoluteString);
    return YES;
}

-(void)dealloc{
    NSLog(@"-----WebViewController销毁啦---");
}


@end
