//
//  TableViewCellType1.m
//  TMSwipeCell
//
//  Created by cocomanber on 2018/7/3.
//  Copyright © 2018年 cocomanber. All rights reserved.
//

#import "TableViewCellType1.h"

@implementation TableViewCellType1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(20, 0, 200, self.contentView.frame.size.height);
        label.text = @"支持纯代码样式";
        [self.contentView addSubview:label];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
