//
//  KnowViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "KnowViewController.h"
#import "KonwledgeModel.h"
#import "NetWorkInterfaceBlock.h"
#import "AFHTTPRequestOperationManager.h"
#import "PublicDefine.h"

@interface KnowViewController ()

@end

@implementation KnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * urlStr = [NSString stringWithFormat:@"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=linkfaq&fid=%@", self.konwLedgeModel.FID];
    AFHTTPRequestOperationManager * request = [AFHTTPRequestOperationManager manager];
    __block KnowViewController * weakSelf = self;
    [request GET:urlStr parameters:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary * dic in responseObject) {
            weakSelf.answerString = dic[@"Answer"];
            weakSelf.questionString = dic[@"Question"];
            [weakSelf addView];
        }
        [self.view reloadInputViews];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];

}

- (void)addView{
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SCREEN_AUTO_SIZE 64, SCREEN_AUTO_SIZE 320, SCREEN_AUTO_SIZE 460)];
    
    UILabel * nameLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 50)];
    nameLable.textAlignment = NSTextAlignmentCenter;
    nameLable.font = [UIFont systemFontOfSize:18];
    nameLable.textColor = [UIColor orangeColor];
    nameLable.numberOfLines = 2;
    nameLable.text = self.questionString;
    [scrollView addSubview:nameLable];
    
    //去掉<br/>
    NSString * introString = [self.answerString stringByReplacingOccurrencesOfString:@"<p class=\"MsoNormal\">" withString:@""];
    NSString * intro1 = [introString stringByReplacingOccurrencesOfString:@"<span>" withString:@""];
    NSString * intro2 = [intro1 stringByReplacingOccurrencesOfString:@"</span>" withString:@""];
    NSString * intro3 = [intro2 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    NSString * intro4 = [intro3 stringByReplacingOccurrencesOfString:@"<b>" withString:@""];
    NSString * intro5 = [intro4 stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    NSString * intro6 = [intro5 stringByReplacingOccurrencesOfString:@"</b>" withString:@""];
    
    
    //计算文本在限定范围内的高度
    NSDictionary * testDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:SCREEN_AUTO_SIZE 16.0], NSFontAttributeName, nil];
    //诗词的高度
    CGRect introRect = [intro6 boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    UILabel * introLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 50, SCREEN_AUTO_SIZE 300, introRect.size.height + SCREEN_AUTO_SIZE 10)];
    introLable.textColor = [UIColor grayColor];
    introLable.font = [UIFont systemFontOfSize:SCREEN_AUTO_SIZE 16.0];
    introLable.text = intro6;
    introLable.numberOfLines = 0;
    [scrollView addSubview:introLable];
    
    scrollView.contentSize = CGSizeMake(SCREEN_AUTO_SIZE 320, CGRectGetMaxY(introLable.frame));
    [self.view addSubview:scrollView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
