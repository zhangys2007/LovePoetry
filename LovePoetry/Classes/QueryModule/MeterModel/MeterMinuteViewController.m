//
//  MeterMinuteViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/6.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "MeterMinuteViewController.h"
#import "MeterModel.h"
#import "PublicDefine.h"

@interface MeterMinuteViewController ()

@end

@implementation MeterMinuteViewController

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
    nameLable.text = self.meterModel.Name;
    nameLable.textColor = [UIColor orangeColor];
    [scrollView addSubview:nameLable];
    
    
    //计算文本在限定范围内的高度
    NSDictionary * testDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:SCREEN_AUTO_SIZE 17.0], NSFontAttributeName, nil];
    //诗词的高度
    CGRect introRect = [self.meterModel.Intro boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    
    UILabel * introLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, SCREEN_AUTO_SIZE 40, SCREEN_AUTO_SIZE 300, introRect.size.height + SCREEN_AUTO_SIZE 10)];
    introLable.text = self.meterModel.Intro;
    introLable.textColor = [UIColor grayColor];
    introLable.numberOfLines = 0;
    [scrollView addSubview:introLable];
    
    UILabel * exampleLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(introLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 19)];
    exampleLable.text = @"※ 范例";
    [scrollView addSubview:exampleLable];
    
    UIImageView * lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(exampleLable.frame), SCREEN_AUTO_SIZE 300, SCREEN_AUTO_SIZE 1)];
    lineImageView.image = [UIImage imageNamed:@"line"];
    [scrollView addSubview:lineImageView];
    
    
    //去掉<br/>
    NSString * sampleString = [self.meterModel.Sample stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
    NSString * sampleStr = [sampleString stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    
    
    //诗词的高度
    CGRect sampleRect = [sampleStr boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    
    UILabel * sampleLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(lineImageView.frame), SCREEN_AUTO_SIZE 300, sampleRect.size.height)];
    sampleLable.text = sampleStr;
    sampleLable.numberOfLines = 0;
    [scrollView addSubview:sampleLable];
    
    CGRect noteRect = [self.meterModel.MelodyNote boundingRectWithSize:CGSizeMake(SCREEN_AUTO_SIZE 300, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:testDic context:nil];
    UILabel * noteLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, CGRectGetMaxY(sampleLable.frame), SCREEN_AUTO_SIZE 300, noteRect.size.height)];
    noteLable.text = self.meterModel.MelodyNote;
    noteLable.textColor = [UIColor grayColor];
    noteLable.numberOfLines = 0;
    [scrollView addSubview:noteLable];
    
    scrollView.contentSize = CGSizeMake(SCREEN_AUTO_SIZE 320, CGRectGetMaxY(noteLable.frame));
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
