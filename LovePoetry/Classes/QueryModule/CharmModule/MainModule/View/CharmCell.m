//
//  CharmCell.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "CharmCell.h"
#import "PublicDefine.h"

@implementation CharmCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_AUTO_SIZE 320, SCREEN_AUTO_SIZE 100)];
        [self addSubview:self.titleImageView];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
