//
//  PoetryModel.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/2.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PoetryModel.h"

@implementation PoetryModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.Appreciation = dic[@"Appreciation"];
        self.Article = dic[@"Article"];
        self.ArtID = dic[@"ArtID"];
        self.Author = dic[@"Author"];
        self.CDate = dic[@"CDate"];
        self.FistIndex = dic[@"FistIndex"];
        self.ImgSrc = dic[@"ImgSrc"];
        self.PDate = dic[@"PDate"];
        self.PubAges = dic[@"PubAges"];
        self.RightCount = dic[@"RightCount"];
        self.Title = dic[@"Title"];
        self.UDate = dic[@"UDate"];
        self.WrongCount = dic[@"WrongCount"];
    }
    return self;
}

@end
