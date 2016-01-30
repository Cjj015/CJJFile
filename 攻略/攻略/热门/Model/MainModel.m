//
//  MainModel.m
//  攻略
//
//  Created by 蔡 on 16/1/28.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

- (id)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
