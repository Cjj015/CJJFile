//
//  RootModel.m
//  攻略
//
//  Created by 蔡 on 16/1/27.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "RootModel.h"

@implementation RootModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
