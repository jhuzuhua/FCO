//
//  FCOCustomIndicatorViewController.m
//  FCO Test
//
//  Created by delmarz on 6/6/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import "FCOCustomIndicatorViewController.h"
#import "FCOLoadingView.h"

@interface FCOCustomIndicatorViewController ()

@end

@implementation FCOCustomIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FCOLoadingView *loadingView = [[FCOLoadingView alloc]init];
    [loadingView setCenter:CGPointMake(self.view.center.x, self.view.center.y + 130)];
    [self.view addSubview:loadingView];
    [loadingView startAnimating];
    
    double delayInSeconds = 5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds *   NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self performSegueWithIdentifier:@"splashToMainSegue" sender:self];
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
