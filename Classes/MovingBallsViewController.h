//
//  MovingBallsViewController.h
//  MovingBalls
//
//  Created by Raja T S Sekhar on 1/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovingBallsViewController : UIViewController {


	NSTimer *myTimer;
	int startX, startY;
	int newX, newY;
	int xOffset, yOffset;
	NSMutableArray *arr;
	float speed;
	IBOutlet UISlider *speedChange;
	BOOL ballAvailable;
}

@property (nonatomic, retain) NSTimer *myTimer;
@property (nonatomic, retain) UISlider *speedChange;

- (IBAction) createBall;
- (void) moveBall:(NSTimer *)theTimer;
- (IBAction) startTimer;
- (IBAction) stopTimer;
- (IBAction) sliderChange;

@end

