//
//  MinuteViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/6.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "MinuteViewController.h"
#import "PublicModel.h"
#import "PublicDefine.h"

@interface MinuteViewController ()

@end

@implementation MinuteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.publicModel.RhyFlag;
    [self addView];
}

- (void)addView{
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_AUTO_SIZE 320, SCREEN_AUTO_SIZE 568)];
    
    UILabel * nameLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 40)];
    nameLable.textAlignment = NSTextAlignmentCenter;
    nameLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 25];
    nameLable.text = self.publicModel.RhyHead;
    nameLable.textColor = [UIColor orangeColor];
    [scrollView addSubview:nameLable];
    
    
    //计算文本在限定范围内的高度
    NSDictionary * testDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:SCREEN_AUTO_SIZE 17.0], NSFontAttributeName, nil];
    //诗词的高度
    CGRect poetryRect = [self.publicModel.RhyMother boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    
    UILabel * motherLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 40, SCREEN_AUTO_SIZE 300, poetryRect.size.height + SCREEN_AUTO_SIZE 10)];
    motherLable.text = self.publicModel.RhyMother;
    motherLable.textColor = [UIColor grayColor];
    motherLable.numberOfLines = 0;
    [scrollView addSubview:motherLable];
    
    //诗词的高度
    CGRect contentRect = [self.publicModel.RhyContent boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    
    UILabel * contentLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(motherLable.frame), SCREEN_AUTO_SIZE 300, contentRect.size.height)];

    contentLable.numberOfLines = 0;
    [scrollView addSubview:contentLable];
    
    //去掉<br/>
    NSString * contentStr = [self.publicModel.RhyContent stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    contentLable.text = contentStr;
    
    scrollView.contentSize = CGSizeMake(SCREEN_AUTO_SIZE 320, CGRectGetMaxY(contentLable.frame));
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
