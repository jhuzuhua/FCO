//
//  CustomAlertViewController.m
//  FCO Test
//
//  Created by Kryptonite on 6/4/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import "CustomAlertViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface CustomAlertViewController ()

@property (strong, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;


@end

@implementation CustomAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:55];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)sendButtonPressed:(UIButton *)sender {
    [self.delegate presentAlertViewController];
}



@end
