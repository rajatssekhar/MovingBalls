//
//  MovingBallsViewController.m
//  MovingBalls
//
//  Created by Raja T S Sekhar on 1/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MovingBallsViewController.h"

@implementation MovingBallsViewController

@synthesize myTimer;
@synthesize speedChange;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	arr = [[NSMutableArray alloc] initWithObjects:nil];
	[speedChange setMinimumValue:0.01f];
	[speedChange setMaximumValue:0.09f];
	[speedChange setValue:0.05f];
	speed = [speedChange value] / 10;
	startX = 220;
	startY = 250;
	xOffset = 1;
	yOffset = 1;
	ballAvailable = NO;
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (IBAction) createBall {
	UIImageView *img =[[UIImageView alloc]initWithFrame:CGRectMake(startX, startY, 30, 30)];
	img.image=[UIImage imageNamed:@"ball_red.png"];
	[self.view addSubview:img];
	[arr addObject:img];
	NSLog(@"%d",[arr count]);
	ballAvailable = YES;
	[img release];
}

- (IBAction) startTimer {
	if (![myTimer isValid] && ballAvailable) {
		myTimer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(moveBall:) userInfo:nil repeats:YES];
	}
	
}

- (IBAction) stopTimer {
	[myTimer invalidate];
	myTimer = nil;
}

- (IBAction) sliderChange {
	speed = [speedChange value] / 10;
	if ([myTimer isValid]) {
		[self stopTimer];
		myTimer = [NSTimer scheduledTimerWithTimeInterval:speed 
												   target:self 
												 selector:@selector(moveBall:) 
												 userInfo:nil 
												  repeats:YES];
	}
	
}

- (void) moveBall:(NSTimer *)theTimer {
	UIImageView *img=[[UIImageView alloc]init];
	for (int i = 0; i < [arr count]; i++) {
		NSLog(@"object at %d %@",i, [arr objectAtIndex:i]);
		img = [arr objectAtIndex:i];
		newX = img.frame.origin.x;
		newY = img.frame.origin.y;
		if (newX > 300) {
			xOffset = -1;
		}
		if (newX < -5) {
			xOffset =  1;
		}
		if (newY > 435) {
			yOffset =  -1;
		}
		if (newY < -5) {
			yOffset =  1;
		}
		
		newX = newX + xOffset;
		newY = newY + yOffset;
		[img setFrame:CGRectMake(newX, newY, 30, 30)];
		[arr replaceObjectAtIndex:i withObject:img];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	BOOL ballTouched = YES;
	UITouch * touch = [touches anyObject];
	CGPoint pos = [touch locationInView: [UIApplication sharedApplication].keyWindow];
	if (pos.x < (startX) || pos.x > (startX +30)) {
		ballTouched = NO;
	}
	if (pos.y < (startY + 15) || pos.y > (startY + 45)) {
		ballTouched = NO;
	}
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
