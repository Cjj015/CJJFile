//
//  CycleViewCell.m
//  攻略
//
//  Created by 蔡 on 16/1/28.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "CycleViewCell.h"
#import "SDCycleScrollView.h"
#import "MainModel.h"

@interface CycleViewCell ()<SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;


@end

@implementation CycleViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cycleView.delegate = self;
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"第%ld张图片", index);
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    if (_dataArr != dataArr) {
        _dataArr = dataArr;
    }
    self.cycleView.imageURLStringsGroup = [dataArr valueForKeyPath:@"image_url"];
}


@end
