//
//  PoetryView.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/2.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PoetryView.h"
#import "PoetryModel.h"
#import "UIImageView+WebCache.h"
#import "PublicDefine.h"

@implementation PoetryView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView{
    
    //诗名
    self.poetryNameLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 30)];
    _poetryNameLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.poetryNameLable];
    
    //作者
    self.writerLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 40, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 20)];
    _writerLable.textAlignment = NSTextAlignmentCenter;
    _writerLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 13];
    [self addSubview:self.writerLable];
    
    //图片
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 60, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 220)];
    [self addSubview:self.imageView];
    
    
    //诗词内容
    self.poetryLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(_imageView.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 30)];
    _poetryLable.textAlignment = NSTextAlignmentCenter;
    _poetryLable.numberOfLines = 0;
    _poetryLable.textColor = [UIColor grayColor];
    _poetryLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 16.0];
    [self addSubview:self.poetryLable];
    
    //☞注释•赏析
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 29)];
    _lable.text = @"☞注释•赏析";
    [self addSubview:_lable];
    
    self.lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 29, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1)];
    _lineImage.image = [UIImage imageNamed:@"line"];
    [self addSubview:_lineImage];
    
    //注释•赏析内容
    self.noteLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 30, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 200)];
    _noteLable.numberOfLines = 0;
    _noteLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 16.0];
    [self addSubview:_noteLable];
    

}

- (void)setModel:(PoetryModel *)model{

    _poetryNameLable.text = model.Title;
    _writerLable.text = model.Author;
    NSString * poetryString = model.Article;
    NSRange range2 = [poetryString rangeOfString:@"&nbsp"];//判断字符串是否包含
    if(range2.length > 0){
        NSString * str = [poetryString stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        _poetryLable.text = [str stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    }else{
        _poetryLable.text = [poetryString stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    }
    //引用第三方 图片下载
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.ImgSrc] placeholderImage:[UIImage imageNamed:@"image1111.jpg"]];
    
    if ([model.Appreciation isEqual:@""]) {
        _lable.text = nil;
        _lineImage.image = nil;
        _noteLable.text = nil;
    }else{
    NSString * noteString = model.Appreciation;
    _noteLable.text = [noteString stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    }
}


@end
