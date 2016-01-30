//
//  RootViewController.m
//  攻略
//
//  Created by 蔡 on 16/1/27.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#define kNet @"http://api.liwushuo.com/v2/items?limit=20&gender=2&generation=1"

#import "RootViewController.h"
#import "RootViewCell.h"
#import "RootModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "DetailViewController.h"
#import "SVProgressHUD.h"

static NSInteger n = 0;

@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation RootViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"";
    self.navigationItem.backBarButtonItem = backBtn;
    [SVProgressHUD showErrorWithStatus:@"亲，请稍等"];
    [self readData];
    [SVProgressHUD dismiss];
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(handleRefresh)];
    self.collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(handleRequest)];
    
}

//读取数据
- (void)readData {
    NSString *str = [NSString stringWithFormat:@"%@&offset=%ld", kNet,n];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:str parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self requestData:responseObject];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    }];
}
//解析
- (void)requestData:(id)response {
    NSArray *arr = response[@"data"][@"items"];
    for (NSDictionary *dic in arr) {
        RootModel *model = [[RootModel alloc] initWithDic:dic[@"data"]];
        [self.dataSource addObject:model];
    }
    [self.collectionView reloadData];
}


#pragma mark - MJRefreshAction -
//下拉刷新
- (void)handleRefresh {
    [self.dataSource removeAllObjects];
    [self readData];
}

//上拉加载
- (void)handleRequest {
    n += 20;
    [self readData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RootViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    RootModel *model = self.dataSource[indexPath.row];
    cell.title.text = model.name;
    cell.price.text = model.price;
    [cell.herderImage sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:[UIImage imageNamed:@"picholder"]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//跳转传值
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    RootModel *detail = self.dataSource[indexPath.row];
    detailVC.URL = detail.url;
    [self.navigationController pushViewController:detailVC animated:YES];
}



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
