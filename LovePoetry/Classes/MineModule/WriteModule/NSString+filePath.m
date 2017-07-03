//
//  NSString+filePath.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "NSString+filePath.h"

@implementation NSString (filePath)


+(NSString *)filePath:(NSString *)fileName
{
    NSString * documentsPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSString * filePath = [documentsPath stringByAppendingPathComponent:fileName];
    return filePath;
}
-(NSString *)documentsFilePath
{
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSString * filePath = [documentsPath stringByAppendingPathComponent:self];
    return filePath;
}

@end
