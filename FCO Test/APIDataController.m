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

static NSString* const BaseURLString = @"http://www.fightcallout.com/api/v1.0/";
static NSString* const Token = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXUyJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6XC9cL2FwaS5mY28uYXBwXC9hcGlcL3YxLjBcL2F1dGhcL2xvZ2luIiwiaWF0IjoiMTQzMzM4MTI4OSIsImV4cCI6IjE0MzMzODQ4ODkiLCJuYmYiOiIxNDMzMzgxMjg5IiwianRpIjoiYTBiZTUwODMzZWM1YjJkOGQ0NTc4YTRjODU0YWZkMDYifQ.MWUwZjM4MzBhNGNmNGJlNzAzOGFiYzA2Y2RhZTE5ZmI3NTlhMDNjZmMzMmJkMjJmN2I1MDYwYWE1YWE4ZTE5ZQ";

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

-(void)loginWithUsername:(NSString*) username withPassword:(NSString*) password{
    
    // Set up request variables and parameters
    NSString *string = [NSString stringWithFormat:@"%@auth/login", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:Token forHTTPHeaderField:@"Authentication"];
    
    NSString *parameters = [NSString stringWithFormat:@"email=%@&password=%@", username, password];
    [request setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"%@", request.description);
    
    // Initialize the request operation and its completion block
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // Handle responses from the server
        NSLog(@"Response - %@", (NSDictionary*) responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // Display alert for errors
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // Start the operation request
    [operation start];
}

#pragma mark - 
    
@end
