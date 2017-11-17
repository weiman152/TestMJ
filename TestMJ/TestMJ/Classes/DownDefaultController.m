//
//  DownDefaultController.m
//  TestMJ
//
//  Created by weiman on 2017/11/17.
//  Copyright © 2017年 weiman. All rights reserved.
//

#import "DownDefaultController.h"
#import "MJRefresh.h"
#import "CustomHeader.h"

@interface DownDefaultController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSMutableArray * dataList;

@end

@implementation DownDefaultController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * view = [[UIView alloc]init];
    [self.view addSubview:view];
    [self initTableView];
    [self addHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.mj_w, self.view.mj_h-64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)addHeader{
    switch (self.type) {
        case RefreshTypeDownNone:
             [self MJRefreshHeader_Default];
            break;
        case RefreshTypeDownDefault:
             [self MJRefreshNormalHeader_Normal];
            break;
        case RefreshTypeDownAnimation:
             [self MJRefreshGifHeader_gif];
            break;
        case RefreshTypeDownHideImage:
             [self MJRefreshStateHeader_state];
            break;
        case RefreshTypeDownHideTime:
             [self MJRefreshHeader_HideTime];
            break;
        case RefreshTypeDownHideState:
             [self MJRefreshHeader_HideState];
            break;
        case RefreshTypeDownCustomText:
             [self MJRefreshHeader_CustomText];
            break;
        case RefreshTypeDownCustomRefreshUI:
             [self MJRefreshHeader_CustomRefresh];
            break;
        default:
            break;
    }
}

/*
 MJRefreshHeader 没有文字和提示，不能弹回去，只能刷新一次
 */
-(void)MJRefreshHeader_Default{
    __weak DownDefaultController * weakSelf = self;
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
    }];
}

/*
 MJRefreshNormalHeader:最常用的那种刷新样式，有刷新状态、有时间、有上下指示的箭头
 */
-(void)MJRefreshNormalHeader_Normal{
    __weak DownDefaultController * weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

/*
MJRefreshStateHeader: 隐藏上下箭头图片，只有状态和时间
 */
-(void)MJRefreshStateHeader_state{
    __weak DownDefaultController * weakSelf = self;
    self.tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
}

/*
MJRefreshGifHeader: 左边带动图的刷新，有时间，有状态
 */
-(void)MJRefreshGifHeader_gif{
    __weak DownDefaultController * weakSelf = self;
    MJRefreshGifHeader * header =  [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    
    NSMutableArray * imagesNormal = [NSMutableArray array];
    for (int i=1; i<51; i++) {
        //dropdown_anim__00060
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%d",i]];
        [imagesNormal addObject:image];
    }
    
    NSMutableArray * imagesPulling = [NSMutableArray array];
    for (int i=51; i<61; i++) {
        //dropdown_anim__00060
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%d",i]];
        [imagesPulling addObject:image];
    }
    
    NSMutableArray * imagesRefreshing = [NSMutableArray array];
    for (int i=1; i<4; i++) {
        //dropdown_loading_01
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%d",i]];
        [imagesRefreshing addObject:image];
    }
    
    [header setImages:imagesNormal forState:MJRefreshStateIdle];
    [header setImages:imagesPulling forState:MJRefreshStatePulling];
    [header setImages:imagesRefreshing forState:MJRefreshStateRefreshing];
    self.tableView.mj_header = header;
}

//把时间隐藏掉
-(void)MJRefreshHeader_HideTime{
    __weak DownDefaultController * weakSelf = self;
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    //隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = header;
}

//把状态隐藏掉
-(void)MJRefreshHeader_HideState{
    __weak DownDefaultController * weakSelf = self;
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    //隐藏状态
    header.stateLabel.hidden = YES;
    self.tableView.mj_header = header;
}

//把状态隐藏掉
-(void)MJRefreshHeader_CustomText{
    __weak DownDefaultController * weakSelf = self;
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    //设置刷新状态的文字
    [header setTitle:@"正常状态" forState:MJRefreshStateIdle];
    [header setTitle:@"刷新状态" forState:MJRefreshStateRefreshing];
    [header setTitle:@"正在下拉状态" forState:MJRefreshStatePulling];
    
    //设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:10];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:7];
    
    //设置文字颜色
    header.stateLabel.textColor = [UIColor redColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    
    self.tableView.mj_header = header;
}

//自定义刷新控件
-(void)MJRefreshHeader_CustomRefresh{
    __weak DownDefaultController * weakSelf = self;
    CustomHeader * header = [CustomHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [weakSelf.tableView reloadData];
        [weakSelf endRefresh];
    }];
    
    self.tableView.mj_header = header;
}

-(void)loadData{
    NSArray * tempArray = @[@"(*^__^*) 嘻嘻……",@"呜呜",@"🐟🐟"];
    [self.dataList insertObjects:tempArray atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, tempArray.count)]];
}

-(void)endRefresh{
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray arrayWithArray:@[@"哈哈哈",@"哗啦啦",@"🌹朵儿",@"菲菲鱼儿"]];
    }
    return _dataList;
}

@end
