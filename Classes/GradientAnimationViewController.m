//
//  GradientAnimationViewController.m
//  GradientAnimation
//
//  Created by test on 9/12/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "GradientAnimationViewController.h"

@implementation GradientAnimationViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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




- (void)viewDidLoad {

    [super viewDidLoad];

	UIView *contentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];

	contentView.backgroundColor = [UIColor blackColor];

	self.view = contentView;
	
	[contentView release];
	
	//Gradient
	gradientLayer = [CAGradientLayer layer];
	
	gradientLayer.frame = CGRectMake(0.0, 0.0, 480.0, 320.0);
	
	startColors = [[NSArray arrayWithObjects:
							(id)[UIColor colorWithWhite:0.7 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.41 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.25 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.83 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.9 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.83 alpha:1.0].CGColor,							
							[UIColor colorWithWhite:0.25 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.41 alpha:1.0].CGColor,
							[UIColor colorWithWhite:0.7 alpha:1.0].CGColor,
							nil] retain];
		
	endColors = 	[[NSArray arrayWithObjects:
					  (id)[UIColor colorWithWhite:0.5 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.21 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.1 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.5 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.55 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.5 alpha:1.0].CGColor,							
					  [UIColor colorWithWhite:0.1 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.21 alpha:1.0].CGColor,
					  [UIColor colorWithWhite:0.5 alpha:1.0].CGColor,
					 nil] retain];;
		
	locations = [[NSArray arrayWithObjects:
					   [NSNumber numberWithFloat:0.0], 
					   [NSNumber numberWithFloat:0.3], 
					   [NSNumber numberWithFloat:0.3],
					   [NSNumber numberWithFloat:0.47],
					   [NSNumber numberWithFloat:0.5],
					   [NSNumber numberWithFloat:0.53],
					   [NSNumber numberWithFloat:0.7],
					   [NSNumber numberWithFloat:0.7],
					   [NSNumber numberWithFloat:1.0], 
					nil] retain];
	
	gradientLayer.colors = startColors;
	
	gradientLayer.locations = locations;
	
	gradientLayer.startPoint = CGPointMake(0.0, 0.5);
	gradientLayer.endPoint = CGPointMake(1.0, 0.5);

	[contentView.layer addSublayer:gradientLayer];

	[self performSelector:@selector(startAnimation) withObject:nil afterDelay:1.5];

}


-(void)startAnimation {
	
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
	
	animation.fromValue = startColors;
	
	animation.toValue = endColors;
	
	 animation.duration	= 2.0;
	 
//	 animation.removedOnCompletion = NO;
//	 
//	 animation.fillMode = kCAFillModeForwards;
	 
	animation.repeatCount = 1e100f;
	
	animation.autoreverses = YES;
	
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	[gradientLayer addAnimation:animation forKey:@"animateGradient"];

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  
  
	  return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
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
