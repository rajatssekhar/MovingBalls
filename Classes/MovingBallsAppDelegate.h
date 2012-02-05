//
//  MovingBallsAppDelegate.h
//  MovingBalls
//
//  Created by Raja T S Sekhar on 1/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovingBallsViewController;

@interface MovingBallsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MovingBallsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MovingBallsViewController *viewController;

@end

