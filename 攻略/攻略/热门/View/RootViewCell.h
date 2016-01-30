//
//  RootViewCell.h
//  攻略
//
//  Created by 蔡 on 16/1/27.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *herderImage;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *price;

@end
