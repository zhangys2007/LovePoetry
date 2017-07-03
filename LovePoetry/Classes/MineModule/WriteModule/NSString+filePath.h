//
//  NSString+filePath.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (filePath)

+(NSString *)filePath:(NSString *)fileName;
-(NSString *)documentsFilePath;

@end
