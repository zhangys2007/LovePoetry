//
//  RecommendViewController.h
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/1.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"
@interface RecommendViewController : UIViewController<UMSocialUIDelegate>

@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, assign)NSInteger total;


@end
