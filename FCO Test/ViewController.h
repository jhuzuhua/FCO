//
//  ViewController.h
//  FCO Test
//
//  Created by Kryptonite on 5/29/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate <NSObject>

@required
-(void)didCancel;

@end


@interface ViewController : UIViewController
@property (weak, nonatomic) id <LoginViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;






@end

