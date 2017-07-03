//
//  PublicModel.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PublicModel.h"
#import "PublicCell.h"

@implementation PublicModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.RhyContent = dic[@"RhyContent"];
        self.RhyFlag = dic[@"RhyFlag"];
        self.RhyHead = dic[@"RhyHead"];
        self.RhyID = dic[@"RhyID"];
        self.RhyMother = dic[@"RhyMother"];
        self.RhyNote = dic[@"RhyNote"];
    }
    return self;
}



@end
