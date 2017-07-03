//
//  PublicCell.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PublicCell.h"
#import "PublicDefine.h"

@implementation PublicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 90, self.frame.size.height)];
        [self addSubview:self.titleLable];
        
        self.subheadLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 100, 0, SCREEN_AUTO_SIZE 190, self.frame.size.height)];
        self.subheadLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.subheadLable];
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
