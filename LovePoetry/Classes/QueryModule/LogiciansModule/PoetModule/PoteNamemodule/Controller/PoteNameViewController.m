//
//  PoteNameViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PoteNameViewController.h"
#import "PoetModel.h"
#import "PublicDefine.h"

@interface PoteNameViewController ()

@end

@implementation PoteNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addView];
}
- (void)addView{
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_AUTO_SIZE 320, SCREEN_AUTO_SIZE 568)];
    
    UILabel * nameLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 40)];
    nameLable.textAlignment = NSTextAlignmentCenter;
    nameLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 25];
    nameLable.text = self.poteModel.Title;
    nameLable.textColor = [UIColor orangeColor];
    [scrollView addSubview:nameLable];
    
    UILabel * autherLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 40, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 20)];
    autherLable.textAlignment = NSTextAlignmentCenter;
    autherLable.text = self.poteModel.AuthorName;
    autherLable.textColor = [UIColor grayColor];
    [scrollView addSubview:autherLable];

    //去掉<br/>
    NSString * bodyString = [self.poteModel.Body stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
    NSString * bodyStr = [bodyString stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    
    //计算文本在限定范围内的高度
    NSDictionary * testDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:SCREEN_AUTO_SIZE 17.0], NSFontAttributeName, nil];
    //诗词的高度
    CGRect BodyRect = [bodyStr boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    
    UILabel * bodyLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 60, SCREEN_AUTO_SIZE 300, BodyRect.size.height + SCREEN_AUTO_SIZE 10)];
    bodyLable.text = bodyStr;
    bodyLable.textColor = [UIColor blueColor];
    bodyLable.numberOfLines = 0;
    [scrollView addSubview:bodyLable];
    
    UILabel * exampleLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(bodyLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 19)];
    exampleLable.text = @"※ 词语解释";
    exampleLable.textColor = [UIColor purpleColor];
    [scrollView addSubview:exampleLable];
    
    UIImageView * lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(exampleLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1)];
    lineImageView.image = [UIImage imageNamed:@"line"];
    [scrollView addSubview:lineImageView];
    
    //去掉<br/>
    NSString * wordNoteString = [self.poteModel.WordNote stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString * sampleStr = [wordNoteString stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    
    //诗词的高度
    CGRect wordNoteRect = [sampleStr boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    
    UILabel * wordNoteLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(lineImageView.frame) +SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 300, wordNoteRect.size.height)];
    wordNoteLable.text = sampleStr;
    wordNoteLable.numberOfLines = 0;
    [scrollView addSubview:wordNoteLable];
    
    UILabel * lable1 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(wordNoteLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 19)];
    lable1.text = @"※ 白话译文";
    lable1.textColor = [UIColor purpleColor];
    [scrollView addSubview:lable1];
    
    UIImageView * line1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(lable1.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1)];
    line1.image = [UIImage imageNamed:@"line"];
    [scrollView addSubview:line1];
    
    
    //去掉<br/>
    NSString * translationString = [self.poteModel.Translation stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString * translationStr = [translationString stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    NSString * translation = [translationStr stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    
    CGRect translationRect = [self.poteModel.Translation boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    UILabel * translationLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(line1.frame), SCREEN_AUTO_SIZE 300, translationRect.size.height)];
    translationLable.text = translation;
    translationLable.textColor = [UIColor grayColor];
    translationLable.numberOfLines = 0;
    [scrollView addSubview:translationLable];
    
    UILabel * lable2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(translationLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 19)];
    lable2.text = @"※ 赏析";
    lable2.textColor = [UIColor purpleColor];
    [scrollView addSubview:lable2];
    
    UIImageView * line2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(lable2.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1)];
    line2.image = [UIImage imageNamed:@"line"];
    [scrollView addSubview:line2];
    
    //去掉<br/>
    NSString * appreciationString = [self.poteModel.Appreciation stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString * appreciationStr = [appreciationString stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    NSString * appreciation = [appreciationStr stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    NSString * apprecia = [appreciation stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString * apprecia1 = [apprecia stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    
    CGRect appreciationRect = [apprecia1 boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    UILabel * appreciationLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(line2.frame), SCREEN_AUTO_SIZE 300, appreciationRect.size.height)];
    appreciationLable.text = apprecia1;
    appreciationLable.textColor = [UIColor blackColor];
    appreciationLable.numberOfLines = 0;
    [scrollView addSubview:appreciationLable];
    
    scrollView.contentSize = CGSizeMake(SCREEN_AUTO_SIZE 320, CGRectGetMaxY(appreciationLable.frame));
     
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
