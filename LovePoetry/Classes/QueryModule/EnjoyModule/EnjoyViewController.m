//
//  EnjoyViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "EnjoyViewController.h"
#import "EnjoyModel.h"
#import "AFHTTPRequestOperationManager.h"
#import "PublicDefine.h"

@interface EnjoyViewController ()

@end

@implementation EnjoyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.enjoyModel.Question;
    
    NSString * urlStr = [NSString stringWithFormat:@"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=linkfaq&fid=%@", self.enjoyModel.FID];
    AFHTTPRequestOperationManager * request = [AFHTTPRequestOperationManager manager];
    __block EnjoyViewController * weakSelf = self;
    [request GET:urlStr parameters:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary * dic in responseObject) {
            weakSelf.answerString = dic[@"Answer"];
            weakSelf.nameString = dic[@"Author"];
        }
        [weakSelf addView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}


- (void)addView{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SCREEN_AUTO_SIZE 64, SCREEN_AUTO_SIZE 320, SCREEN_AUTO_SIZE 460)];

    
    UILabel * nameLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 30)];
    nameLable.textAlignment = NSTextAlignmentCenter;
    nameLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 18];
    nameLable.textColor = [UIColor blueColor];
    nameLable.numberOfLines = 1;
    nameLable.text = self.nameString;
    nameLable.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:nameLable];
        
        //去掉<br/>
    NSString * introString = [self.answerString stringByReplacingOccurrencesOfString:@"<span style=\"line-height:1.5;\">" withString:@""];
    NSString * intro1 = [introString stringByReplacingOccurrencesOfString:@"<span>" withString:@""];
    NSString * intro2 = [intro1 stringByReplacingOccurrencesOfString:@"</span>" withString:@""];
    NSString * intro3 = [intro2 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    NSString * intro4 = [intro3 stringByReplacingOccurrencesOfString:@"<b>" withString:@""];
    NSString * intro5 = [intro4 stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString * intro6 = [intro5 stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    NSString * intro7 = [intro6 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    
    //计算文本在限定范围内的高度
//    NSDictionary * testDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16.0], NSFontAttributeName, nil];
    //高度
//    CGRect introRect = [intro7 boundingRectWithSize:CGSizeMake(300, 00) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    UILabel * introLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 30, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1000)];
    introLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 16.0];
    introLable.text = intro7;
    introLable.numberOfLines = 0;
    [scrollView addSubview:introLable];
    scrollView.contentSize = CGSizeMake(SCREEN_AUTO_SIZE 320, CGRectGetMaxY(introLable.frame));
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
