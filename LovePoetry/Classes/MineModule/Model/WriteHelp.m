//
//  WriteHelp.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/8.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "WriteHelp.h"

@implementation WriteHelp

+ (WriteHelp *)shareWriteHelp{
    static WriteHelp * writeHelp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        writeHelp = [[WriteHelp alloc] init];
    });
    return writeHelp;
}

@end
