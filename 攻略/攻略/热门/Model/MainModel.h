//
//  MainModel.h
//  攻略
//
//  Created by 蔡 on 16/1/28.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

@property (nonatomic, strong) NSString *image_url;

- (id)initWithDic:(NSDictionary *)dic;

@end
