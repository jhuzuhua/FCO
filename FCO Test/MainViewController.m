//
//  MainViewController.m
//  FCO Test
//
//  Created by delmarz on 6/6/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import "MainViewController.h"
#import "CallOutTableViewCell.h"


@interface MainViewController ()


@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)loginBarItemPressed:(UIBarButtonItem *)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.+
    
 
    
    [self tabBarFontName];
    [self setSegmentedControlFontColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)loginBarItemPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"mainToLoginSegue" sender:self];
}

- (void)tabBarFontName {
    [[UISegmentedControl appearance] setTitleTextAttributes:@{
                                                              NSForegroundColorAttributeName : [UIColor whiteColor]
                                                              } forState:UIControlStateNormal];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"FederalEscort" size:21], NSFontAttributeName, [UIColor lightGrayColor], NSForegroundColorAttributeName, nil]];
}

- (void)setSegmentedControlFontColor {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"HelveticaNeue-Medium" size:12], NSFontAttributeName,
                                [UIColor whiteColor], NSForegroundColorAttributeName,
                                nil];
    NSDictionary *attributes2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIFont fontWithName:@"HelveticaNeue-Medium" size:12], NSFontAttributeName,
                                [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                nil];
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateSelected];
    [self.segmentedControl setTitleTextAttributes:attributes2 forState:UIControlStateNormal];
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CallOutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.boxingTitleLabel.text = @"boxing";
        cell.leftOpponentImageView.image = [UIImage imageNamed:@"miketyson.png"];
        cell.rightOpponentImageView.image = [UIImage imageNamed:@"floydmayweather.png"];
        
    }else {
        cell.boxingTitleLabel.text = @"ufc";
    }
    
    
    return cell;
    
}

#pragma mark - LoginView Delegate

- (void)didCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CallOutViewCell Delegate

-(void)callOutCellButton {
    [self performSegueWithIdentifier:@"mainViewToDetailSegue" sender:self];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mainToLoginSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
            
            ViewController *vc = segue.destinationViewController;
            vc.delegate = self;
        }
    }
   

  
}



@end
