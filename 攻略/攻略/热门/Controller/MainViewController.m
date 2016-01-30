//
//  MainViewController.m
//  攻略
//
//  Created by 蔡 on 16/1/28.
//  Copyright © 2016年 lanouhn. All rights reserved.
//
#define KScreenSize [UIScreen mainScreen].bounds.size.width
#define kCycleNet @"http://api.liwushuo.com/v2/banners"

#import "MainViewController.h"
#import "CycleViewCell.h"
#import "ListViewCell.h"
#import "AFNetworking.h"
#import "MainModel.h"

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray *cycleArr;
@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation MainViewController

- (NSMutableArray *)cycleArr {
    if (!_cycleArr) {
        self.cycleArr = [NSMutableArray array];
    }
    return _cycleArr;
}

- (NSMutableArray *)listArr {
    if (!_listArr) {
        self.listArr = [NSMutableArray array];
    }
    return _listArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collection.delegate = self;
    self.collection.dataSource = self;
    
    [self.collection registerNib:[UINib nibWithNibName:@"CycleViewCell" bundle:nil] forCellWithReuseIdentifier:@"cycleViewCell"];
    [self.collection registerNib:[UINib nibWithNibName:@"ListViewCell" bundle:nil] forCellWithReuseIdentifier:@"listViewCell"];
    
    [self readData];
    
}

- (void)readData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:kCycleNet parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self requestData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
}

- (void)requestData:(id)response {
    NSArray *arr = response[@"data"][@"banners"];
    for (NSDictionary *dic in arr) {
        MainModel *model = [[MainModel alloc] initWithDic:dic];
        [self.cycleArr addObject:model];
    }
    [self.collection reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CycleViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cycleViewCell" forIndexPath:indexPath];
        if (self.cycleArr.count != 0) {
            cell.dataArr = self.cycleArr;
        }
        return cell;
    }else {
        ListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"listViewCell" forIndexPath:indexPath];
        return cell;
    }
}



#pragma mark - UICollectionViewDelegateFlowLayout -
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(KScreenSize, 200);
    } else {
        return CGSizeMake(KScreenSize / 3.5, (KScreenSize - 4) / 3.0);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(-64, 0, 0, 0);
    } else {
        return UIEdgeInsetsMake(5, 15, -44, 15);
    }
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
