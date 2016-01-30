//
//  RootModel.h
//  攻略
//
//  Created by 蔡 on 16/1/27.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootModel : NSObject

@property (nonatomic, strong) NSString *cover_image_url;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *purchase_url;
@property (nonatomic, assign) NSInteger id;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
