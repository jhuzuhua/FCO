//
//  CustomAlertViewController.h
//  FCO Test
//
//  Created by Kryptonite on 6/4/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertViewControllerDelegate <NSObject>


@required
- (void)presentAlertViewController;

@end

@interface CustomAlertViewController : UIViewController
@property (weak, nonatomic) id <AlertViewControllerDelegate> delegate;

@end
