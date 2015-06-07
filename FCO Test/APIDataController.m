//
//  APIDataController.m
//  FCO Test
//
//  Created by Kryptonite on 6/8/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import "APIDataController.h"

@implementation APIDataController

static APIDataController *mainDataController;

static NSString* const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";

#pragma mark - Class Methods

+(APIDataController *) getInstance{
    //	@synchronized(self)
    {
        if (!mainDataController){
            mainDataController = [[APIDataController alloc] init];
        }
        
        
        return mainDataController;
    }
}
+(id)alloc{
    //	@synchronized(self)
    {
        NSAssert(mainDataController == nil, @"Attempted to allocate a second instance of a singleton.");
        mainDataController = [super alloc];
        return mainDataController;
    }
}
+(id)copy{
    //  @synchronized(self)
    {
        NSAssert(mainDataController == nil, @"Attempted to copy the singleton.");
        return mainDataController;
    }
}

#pragma mark - Login

-(void)loginUserWithParameters{
    
    //1
    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", (NSDictionary*) responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}
    
@end
