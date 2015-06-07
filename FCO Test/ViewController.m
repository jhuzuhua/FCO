//
//  ViewController.m
//  FCO Test
//
//  Created by Kryptonite on 5/29/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import "ViewController.h"
#import "HTTPClient.h"
#import <AFNetworking.h>
#import <IQKeyboardReturnKeyHandler.h>
#import "MONPromptView.h"
#import "CustomAlertViewController.h"
#import "TransitionAnimator.h"
#import "APIDataController.h"

@interface ViewController () <AlertViewControllerDelegate, UIViewControllerTransitioningDelegate>


@property (nonatomic, assign) BOOL screensaverLaunched;

@property (strong, nonatomic) IBOutlet UIView *loginView;
@property (strong, nonatomic) IBOutlet UIView *signupView;


@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) IBOutlet UIButton *signupButton;


@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewKeyboard;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewLogoKeyboard;



@property (nonatomic, strong) UIView *adjustingView;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;






@end

@implementation ViewController
{
    IQKeyboardReturnKeyHandler *returnKeyHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    [self.signupView setHidden:YES];
    returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    [self.signupView setHidden:YES];
    [self.loginView setHidden:NO];
    [self.signupButton setEnabled:YES];
    [self.loginButton setEnabled:NO];
}




- (IBAction)signupButtonPressed:(UIButton *)sender {
    [self.signupView setHidden:NO];
    [self.loginView setHidden:YES];
    [self.signupButton setEnabled:NO];
    [self.loginButton setEnabled:YES];
}


- (IBAction)forgotButtonPressed:(UIButton *)sender {
    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    CustomAlertViewController *customAlerViewController = [myStoryboard instantiateViewControllerWithIdentifier:@"AlertVC"];
    customAlerViewController.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.75];
    customAlerViewController.transitioningDelegate = self;
    customAlerViewController.delegate = self;
    customAlerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:customAlerViewController animated:true completion:nil];
}

#pragma mark - Custom AlertView Controller
- (void)presentAlertViewController {
    [self dismissViewControllerAnimated:true completion:nil];
}


#pragma mark - Transitioning Delegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    TransitionAnimator *animator = [[TransitionAnimator alloc]init];
    animator.presenting = true;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TransitionAnimator *animator = [[TransitionAnimator alloc]init];
    return animator;
    
}



- (IBAction)loginPressed:(UIButton *)sender {
    /*NSString *title = @"Login Failed";
    NSString *message = @"Invalid Email or Password";
    NSString *dismissTitle = @"OK";
    NSDictionary *attributes = @{ kMONPromptViewAttribDismissButtonBackgroundColor: [UIColor colorWithRed:107/255.0f green:12/255.0f blue:13/255.0f alpha:1.0f],
                                  kMONPromptViewAttribDismissButtonTextColor: [UIColor whiteColor],
                                  kMONPromptViewAttribDismissButtonFont : [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0f],
                                  kMONPromptViewAttribDismissButtonFont: [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f],
                                  kMONPromptViewAttribMessageFont: [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f],
                                  kMONPromptViewAttribTitleFont: [UIFont fontWithName:@"FederalEscort" size:18.0f],
                                  kMONPromptViewAttribTitleTextColor : [UIColor colorWithRed:149/255.0f green:149/255.0f blue:149/255.0f alpha:1.0f]};
    MONPromptView *promptView = [[MONPromptView alloc] initWithTitle:title
                                                             message:message
                                                  dismissButtonTitle:dismissTitle
                                                          attributes:attributes];
    
    [promptView showInView:self.view];
     */
    
    //[self performSegueWithIdentifier:@"loginToMainSegue" sender:self];
    
    //Call APIDataController and Login Function:
    APIDataController *controller = [APIDataController getInstance];
    [controller loginWithUsername:@"israel" withPassword:@"1234"];
    
    
}


- (IBAction)signupPressed:(UIButton *)sender {
    NSString *title = @"Error";
    NSString *message = @"Password did not match!";
    NSString *dismissTitle = @"OK";
    NSDictionary *attributes = @{ kMONPromptViewAttribDismissButtonBackgroundColor: [UIColor colorWithRed:107/255.0f green:12/255.0f blue:13/255.0f alpha:1.0f],
                                  kMONPromptViewAttribDismissButtonTextColor: [UIColor whiteColor],
                                  kMONPromptViewAttribDismissButtonFont : [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0f],
                                  kMONPromptViewAttribDismissButtonFont: [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f],
                                  kMONPromptViewAttribMessageFont: [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f],
                                  kMONPromptViewAttribTitleFont: [UIFont fontWithName:@"FederalEscort" size:18.0f],
                                  kMONPromptViewAttribTitleTextColor : [UIColor colorWithRed:149/255.0f green:149/255.0f blue:149/255.0f alpha:1.0f]};
    MONPromptView *promptView = [[MONPromptView alloc] initWithTitle:title
                                                             message:message
                                                  dismissButtonTitle:dismissTitle
                                                          attributes:attributes];
    
    [promptView showInView:self.view];
}




- (void)keyboardWillShow:(NSNotification*)aNotification {
  
    self.imageView.hidden = YES;
    self.imageViewKeyboard.hidden = NO;
    
    
}

- (void)keyboardWillHide:(NSNotification*)aNotification {
    self.imageView.hidden = NO;
    self.imageViewKeyboard.hidden = YES;
    
}



@end