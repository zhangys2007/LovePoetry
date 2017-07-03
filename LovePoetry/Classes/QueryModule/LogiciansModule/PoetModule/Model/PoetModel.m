//
//  PoetModel.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PoetModel.h"

@implementation PoetModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.PoemID = dic[@"PoemID"];
        self.Title = dic[@"Title"];
        self.Body = dic[@"Body"];
        self.Appreciation = dic[@"Appreciation"];
        self.PubAges = dic[@"PubAges"];
        self.AuthorID = dic[@"AuthorID"];
        self.AuthorName = dic[@"AuthorName"];
        self.Type = dic[@"Type"];
        self.WordNote = dic[@"WordNote"];
        self.Translation = dic[@"Translation"];
        self.PoemEra = dic[@"PoemEra"];
    }
    return self;
}

@end
