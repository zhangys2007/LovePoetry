//
//  EnjoyCell.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "EnjoyCell.h"
#import "PublicDefine.h"

@implementation EnjoyCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置cell样式
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 10, 0, SCREEN_AUTO_SIZE 200, self.frame.size.height)];
        [self addSubview:self.titleLable];
        
        self.subheadLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_AUTO_SIZE 210, 0, SCREEN_AUTO_SIZE 80, self.frame.size.height)];
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
