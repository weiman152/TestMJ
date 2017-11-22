//
//  UpRefreshController.m
//  TestMJ
//
//  Created by weiman on 2017/11/17.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "UpRefreshController.h"
#import "MJRefresh.h"
#import "CustomFooter.h"

@interface UpRefreshController ()<UITableViewDelegate,UITableViewDataSource>
//用于刷新的tableView
@property(nonatomic,strong)UITableView * tableView;
//数据源
@property(nonatomic,strong)NSMutableArray * dataList;

@end

@implementation UpRefreshController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self setFooterRefreshType];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setFooterRefreshType{
    switch (self.type) {
        case UpRefreshTypeNone:
            [self refreshNone];
            break;
        case UpRefreshTypeBack:
            [self refreshBack];
            break;
        case UpRefreshTypeBackGif:
            [self refreshBackGif];
            break;
        case UpRefreshTypeBackState:
            [self refreshBackState];
            break;
        case UpRefreshTypeBackNormal:
            [self refreshBackNormal];
            break;
        case UpRefreshTypeAuto:
            [self refreshAuto];
            break;
        case UpRefreshTypeAutoGif:
            [self refreshAutoGif];
            break;
        case UpRefreshTypeAutoState:
            [self refreshAutoState];
            break;
        case UpRefreshTypeAutoNormal:
            [self refreshAutoNormal];
            break;
        case UpRefreshTypeAnimationCustom:
            [self refreshAnimationCustom];
            break;
        case UpRefreshTypeAnimationGif:
            [self refreshAnimationGif];
            break;
        default:
            break;
    }
}

//没有效果,也不会刷新
-(void)refreshNone{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//没有任何刷新的UI，但是有刷新效果
-(void)refreshBack{
      __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//有文字刷新状态，有刷新效果
-(void)refreshBackGif{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//和MJRefreshBackGifFooter 一样 只有文字刷新状态，有刷新效果
-(void)refreshBackState{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//有文字状态也有图片，有刷新效果
-(void)refreshBackNormal{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//没有任何UI，但是有刷新效果
-(void)refreshAuto{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//有文字，有效果，注意：这个文字是紧跟最后一个有数据的cell的位置，并不是隐藏起来的
-(void)refreshAutoGif{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//有文字，有效果，和MJRefreshAutoGifFooter一个效果
-(void)refreshAutoState{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

//有文字，刷新有图片，有刷新效果。
-(void)refreshAutoNormal{
    __weak UpRefreshController * weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

-(void)refreshAnimationCustom{
    __weak UpRefreshController * weakSelf = self;
    CustomFooter * footer = [CustomFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    self.tableView.mj_footer = footer;
}

-(void)refreshAnimationGif{
    __weak UpRefreshController * weakSelf = self;
    MJRefreshAutoGifFooter * footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataMore];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    
    //设置正在刷新状态的动画图片
    NSMutableArray * refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd",i]];
        [refreshingImages addObject:image];
    }
    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_footer = footer;
}


-(void)loadDataMore{
    [self.dataList addObjectsFromArray:@[@"小桥流水哗啦啦",@"轻轻巧巧过家家",@"和和美美过日子",@"呼呼啦啦行千家"]];
}

-(void)endRefresh{
    [self.tableView.mj_footer endRefreshing];
}

-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.mj_w, self.view.mj_h) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil];
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray arrayWithArray:@[@"学习吧",@"加油哈",@"小红花",@"🌹🌹🌹"]];
    }
    return _dataList;
}

@end







