//
//  CallOutTableViewCell.h
//  FCO Test
//
//  Created by delmarz on 6/7/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CallOutTableViewCellDelegate <NSObject>

@required
- (void)callOutCellButton;

@end

@interface CallOutTableViewCell : UITableViewCell
@property (weak, nonatomic) id <CallOutTableViewCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITableViewCell *calloutTableView;

@property (strong, nonatomic) IBOutlet UILabel *boxingTitleLabel;

@property (strong, nonatomic) IBOutlet UIImageView *leftOpponentImageView;
@property (strong, nonatomic) IBOutlet UIImageView *rightOpponentImageView;

@property (strong, nonatomic) IBOutlet UILabel *leftOpponentNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightOpponentNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;


@property (strong, nonatomic) IBOutlet UILabel *datePeriodLabel;

@property (strong, nonatomic) IBOutlet UILabel *userCalloutLabel;

@property (strong, nonatomic) IBOutlet UILabel *leftOpponentNameCallOutLabel;

@property (strong, nonatomic) IBOutlet UILabel *rightOpponentNameCallOutLabel;

- (IBAction)viewDetailsButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIView *customLine;


@end
