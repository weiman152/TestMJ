//
//  ViewController.m
//  TestMJ
//
//  Created by weiman on 2017/11/16.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "ViewController.h"
#import "DownDefaultController.h"

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
                       @[@"(MJRefreshHeader)",@"(MJRefreshNormalHeader)",@"MJRefreshGifHeader",@"MJRefreshStateHeader",@"自定义文字",@"自定义刷新控件"],
                       @[@"默认",@"动画图片",@"隐藏刷新状态的文字",@"全部加载完毕",@"禁止自动加载",@"自定义文字",@"加载后隐藏",@"自动回弹的上拉01",@"自动回弹的上拉02",@"自定义刷新控件（自动刷新）",@"自定义刷新控件(自动回弹)"],
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
                {
                    downVC.type = RefreshTypeDownDefault;
                }
                    break;
                case 1:
                {
                    downVC.type = RefreshTypeDownAnimation;
                }
                    break;
                case 2:
                {
                    downVC.type = RefreshTypeDownHideTime;
                }
                    break;
                case 3:
                {
                     downVC.type = RefreshTypeDownHideState;
                }
                    break;
                case 4:
                {
                    
                }
                    break;
                default:
                    break;
            }
             [self.navigationController pushViewController:downVC animated:YES];
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                
                }
                    break;
                    
                default:
                    break;
            }
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
