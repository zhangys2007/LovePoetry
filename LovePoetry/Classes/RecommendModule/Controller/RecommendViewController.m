//
//  RecommendViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/1.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "RecommendViewController.h"
#import "PoetryView.h"
#import "NetWorkInterfaceBlock.h"
#import "PoetryModel.h"
#import "UIImageView+WebCache.h"
#import "UMSocial.h"
#import "PublicDefine.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)PoetryView * poetryView;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_action"] style:UIBarButtonItemStylePlain target:self action:@selector(nva_actionResult)];
    
    self.navigationItem.rightBarButtonItem= rightItem;
    self.title = @"每日一荐";
    
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,  64, [UIScreen mainScreen].bounds.size.width, SCREEN_AUTO_SIZE 460)];
    scrollView.contentSize = CGSizeMake(SCREEN_AUTO_SIZE 320 * 10, SCREEN_AUTO_SIZE 460);
    scrollView.directionalLockEnabled = YES;//YES时不能两个方向同时滚动
//    scrollView.bounces = NO;//关闭弹跳效果
    scrollView.showsHorizontalScrollIndicator = NO;//关闭水平方向的滚动条
    //宽度大于100 , 整页翻动
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    //数据加载
    NetWorkInterfaceBlock * netWork = [[NetWorkInterfaceBlock alloc] initWithSuccessful:^(NSDictionary *dic) {
        NSArray * array = dic[@"rows"];
        self.total = [dic[@"total"] integerValue];
        self.dataArray = [NSMutableArray new];
        for (NSDictionary * dic in array) {
            PoetryModel * poetry = [[PoetryModel alloc] initWithDictionary:dic];
            [self.dataArray addObject:poetry];
        }
        for (int i = 0; i < 10; i++) {
            self.poetryView = [[PoetryView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, SCREEN_AUTO_SIZE 460)];
            _poetryView.model = self.dataArray[i];
            
            //计算文本在限定范围内的高度
            NSDictionary * testDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:SCREEN_AUTO_SIZE 16.0], NSFontAttributeName, nil];
            //诗词的高度
            CGRect poetryRect = [((PoetryModel *)self.dataArray[i]).Article boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
            //重写poetryLable.frame
            _poetryView.poetryLable.frame = CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 290, SCREEN_AUTO_SIZE 300, poetryRect.size.height);
            //重写lable.frame
            _poetryView.lable.frame = CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(_poetryView.poetryLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 29);
            //重写lineImage.frame
            _poetryView.lineImage.frame = CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(_poetryView.lable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1);
            //赏析的高度
            CGRect noteRect = [((PoetryModel *)self.dataArray[i]).Appreciation boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
            //重写noteLable.frame
            _poetryView.noteLable.frame = CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(_poetryView.lineImage.frame), SCREEN_AUTO_SIZE 300, noteRect.size.height);
            //重写_poetryView.contentSize
            _poetryView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(_poetryView.noteLable.frame) + SCREEN_AUTO_SIZE 10);
            
            [scrollView addSubview:_poetryView];
            [self.view addSubview:scrollView];
        }
    } fail:^BOOL(NSError *error) {
        return YES;
    }];
    [netWork get:@"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=home&pageindex=0&pagesize=10"];
}

#pragma  mark UIScrollViewDelegate

//分享
- (void)nva_actionResult{

    [UMSocialSnsService presentSnsIconSheetView:self appKey:nil shareText:@"爱上诗词,中华在我心!" shareImage:[UIImage imageNamed:@"icon.png"] shareToSnsNames:@[UMShareToSina, UMShareToQQ, UMShareToSms, UMShareToWechatFavorite] delegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
