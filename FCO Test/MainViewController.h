//
//  MainViewController.h
//  FCO Test
//
//  Created by delmarz on 6/6/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "CallOutTableViewCell.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, LoginViewControllerDelegate, CallOutTableViewCellDelegate>

@end
