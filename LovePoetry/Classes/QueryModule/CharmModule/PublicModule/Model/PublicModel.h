//
//  PublicModel.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicModel : NSObject

@property (nonatomic, copy)NSString * RhyContent;
@property (nonatomic, copy)NSString * RhyFlag;
@property (nonatomic, copy)NSString * RhyHead;
@property (nonatomic, strong)NSNumber * RhyID;
@property (nonatomic, copy)NSString * RhyMother;
@property (nonatomic, copy)NSString * RhyNote;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
