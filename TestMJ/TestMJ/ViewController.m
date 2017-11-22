//
//  ViewController.m
//  TestMJ
//
//  Created by weiman on 2017/11/16.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "ViewController.h"
#import "DownDefaultController.h"
#import "UpRefreshController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray * dataList;
@property (nonatomic,strong)NSArray * titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self initDataList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTableView{

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(void)initDataList{
    NSArray * arr = @[
                      @[@"RefreshTypeDownNone(MJRefreshHeader)",
                        @"RefreshTypeDownDefault(MJRefreshNormalHeader)",
                        @"RefreshTypeDownAnimation(MJRefreshGifHeader)",
                        @"RefreshTypeDownHideImage(MJRefreshStateHeader)",
                        @"RefreshTypeDownHideTime(MJRefreshNormalHeader)",
                        @"RefreshTypeDownHideState",
                        @"RefreshTypeDownCustomText",
                        @"RefreshTypeDownCustomRefreshUI"],
                      @[@"没有刷新效果(MJRefreshFooter)",
                        @"有效果但是没有UI(MJRefreshBackFooter)",
                        @"只有刷新文字(MJRefreshBackGifFooter)",
                        @"只有刷新文字(MJRefreshBackStateFooter)",
                        @"有文字，有图片，有刷新效果(MJRefreshBackNormalFooter)",
                        @"没有UI，但是有效果(MJRefreshAutoFooter)",
                        @"有文字，有效果，位置紧跟cell（MJRefreshAutoGifFooter）",
                        @"有文字，有效果，位置与AutoGif一样(MJRefreshAutoStateFooter)",
                        @"有文字，有效果，位置与AutoGif一样(MJRefreshAutoNormalFooter)",
                        @"动画刷新(CustomFooter)",
                        @"动画刷新(MJRefreshAutoGifFooter)"],
                       @[@"上下拉刷新"],
                       @[@"下拉刷新"]
                      ];
    [self.dataList addObjectsFromArray:arr];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * tempArray = self.dataList[section];
    return tempArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSArray * tempArray = self.dataList[indexPath.section];
    NSString * str = tempArray[indexPath.row];
    cell.textLabel.text  = str;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titleArray[section];
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
             DownDefaultController * downVC = [[DownDefaultController alloc] init];
            switch (indexPath.row) {
                case 0:
                    downVC.type = RefreshTypeDownNone;
                    break;
                case 1:
                    downVC.type = RefreshTypeDownDefault;
                    break;
                case 2:
                    downVC.type = RefreshTypeDownAnimation;
                    break;
                case 3:
                     downVC.type = RefreshTypeDownHideImage;
                    break;
                case 4:
                     downVC.type = RefreshTypeDownHideTime;
                    break;
                case 5:
                    downVC.type = RefreshTypeDownHideState;
                    break;
                case 6:
                    downVC.type = RefreshTypeDownCustomText;
                    break;
                case 7:
                    downVC.type = RefreshTypeDownCustomRefreshUI;
                    break;
                default:
                    break;
            }
             [self.navigationController pushViewController:downVC animated:YES];
        }
            break;
        case 1:
        {
            UpRefreshController * upVC = [[UpRefreshController alloc] init];
            switch (indexPath.row) {
                case 0:
                    upVC.type = UpRefreshTypeNone;
                    break;
                case 1:
                    upVC.type = UpRefreshTypeBack;
                    break;
                case 2:
                    upVC.type = UpRefreshTypeBackGif;
                    break;
                case 3:
                    upVC.type = UpRefreshTypeBackState;
                    break;
                case 4:
                    upVC.type = UpRefreshTypeBackNormal;
                    break;
                case 5:
                    upVC.type = UpRefreshTypeAuto;
                    break;
                case 6:
                    upVC.type = UpRefreshTypeAutoGif;
                    break;
                case 7:
                    upVC.type = UpRefreshTypeAutoState;
                    break;
                case 8:
                    upVC.type = UpRefreshTypeAutoNormal;
                    break;
                case 9:
                    upVC.type = UpRefreshTypeAnimationCustom;
                    break;
                case 10:
                    upVC.type = UpRefreshTypeAnimationGif;
                    break;
                default:
                    break;
            }
            [self.navigationController pushViewController:upVC animated:YES];
        }
            break;
        case 2:
        {
        
        }
            break;
        case 3:
        {
        
        }
            break;
        default:
            break;
    }
}

#pragma mark - get set
-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"下拉刷新",@"上拉刷新",@"collectionView",@"webView"];
    }
    return _titleArray;
}

@end
