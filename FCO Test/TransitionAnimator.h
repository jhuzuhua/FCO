//
//  TransitionAnimator.h
//  FCO Test
//
//  Created by Kryptonite on 6/4/15.
//  Copyright (c) 2015 Kryptonite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;

@end
