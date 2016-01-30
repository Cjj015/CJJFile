//
//  RootViewCell.m
//  攻略
//
//  Created by 蔡 on 16/1/27.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "RootViewCell.h"

@implementation RootViewCell

- (UILabel *)title {
    if (!_title) {
        _title.numberOfLines = 0;
    }
    return _title;
}

@end
