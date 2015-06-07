//
//  APIDataController.h
//  FCO Test
//
//  Created by Kryptonite on 6/8/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface APIDataController : NSObject{
    
}

+ (APIDataController *)getInstance;

-(void)loginWithUsername:(NSString*) username withPassword:(NSString*) password;

@end
