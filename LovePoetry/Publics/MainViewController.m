//
//  MainViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/1.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "MainViewController.h"
#import "RecommendViewController.h"
#import "SubjectTableViewController.h"
#import "QueryTableViewController.h"
#import "MineViewController.h"
#import "SettingTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addControllers];
}

- (void)addControllers{
    //每日一荐
    RecommendViewController * recommendVC = [[RecommendViewController alloc] init];
    UINavigationController * recommendNC =[[UINavigationController alloc] initWithRootViewController:recommendVC];
    recommendNC.title = @"每日一荐";
    //诗词曲库
    SubjectTableViewController * subjectTVC = [[SubjectTableViewController alloc] init];
    UINavigationController * subjectNC = [[UINavigationController alloc] initWithRootViewController:subjectTVC];
    subjectNC.title = @"诗词曲库";
    //写作常识
    QueryTableViewController * queryTVC = [[QueryTableViewController alloc] init];
    UINavigationController * queryNC = [[UINavigationController alloc] initWithRootViewController:queryTVC];
    queryNC.title = @"写作常识";
    //我的写作
    SettingTableViewController * mineVC= [[SettingTableViewController alloc] init];
    UINavigationController * mineNC = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNC.title = @"我的设置";

    self.viewControllers = @[recommendNC, queryNC, mineNC];
    self.tabBar.barStyle = UIBarStyleBlack;
    
    NSArray * imageArray = @[@"tab_featured"  , @"tab_top", @"tab_write"];
    NSArray * selectArray = @[@"tab_featured_seclected" , @"tab_top_seclected", @"tab_write_selected"];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        UINavigationController * nva = [self.viewControllers objectAtIndex:i];
        nva.navigationBar.barStyle = UIBarStyleBlack;
        
        nva.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nva.tabBarItem.selectedImage = [[UIImage imageNamed:selectArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
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
