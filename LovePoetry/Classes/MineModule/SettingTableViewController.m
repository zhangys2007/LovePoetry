//
//  SettingTableViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/2.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "SettingTableViewController.h"
#import "BDKNotifyHUD.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface SettingTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的设置";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else{
    return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * reuseIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"清理缓存\t\t\t\t\t\t %.2fM",[[SDImageCache sharedImageCache] getSize]/1024/1024.0];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"联系我们";
        }else{
            cell.textLabel.text = @"版本信息";
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        //清理缓存
        BDKNotifyHUD *hud = [BDKNotifyHUD notifyHUDWithView:nil
                                                       text:[NSString stringWithFormat:@"\n\n为你清理%.2fM缓存！\n\n", [[SDImageCache sharedImageCache] getSize]/1024/1024.0]];
        hud.center = CGPointMake(self.tableView.center.x, 150);
        [self.view addSubview:hud];
        [hud presentWithDuration:1.0f speed:0.5f inView:self.view completion:^{
            [hud removeFromSuperview];
        }];
        [[SDImageCache sharedImageCache] clearDisk];
        [self.tableView reloadData];
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //意见反馈
            UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"意见反馈" message:@"请联系官方QQ：771012516" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertview show];
        }else if (indexPath.row == 1){
            BDKNotifyHUD *hud = [BDKNotifyHUD notifyHUDWithView:nil
                                                           text:@"\n\n当前1.01版本\n\n"];
            hud.center = CGPointMake(self.tableView.center.x, 150);
            [self.view addSubview:hud];
            [hud presentWithDuration:1.0f speed:0.5f inView:self.view completion:^{
                [hud removeFromSuperview];
            }];
            [self.tableView reloadData];
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
