//
//  CallOutTableViewCell.m
//  FCO Test
//
//  Created by delmarz on 6/7/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import "CallOutTableViewCell.h"

@implementation CallOutTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [[NSBundle mainBundle] loadNibNamed:@"CallOutTableViewCell" owner:self options:nil];
    [self addSubview:self.calloutTableView];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewDetailsButtonPressed:(UIButton *)sender {
    
    [self.delegate callOutCellButton];
    
}

@end
