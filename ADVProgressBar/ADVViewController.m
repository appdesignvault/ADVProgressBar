//
//  ADVViewController.m
//  ADVProgressBar
//
//
/*
 The MIT License
 
 Original work Copyright (c) 2011 Tope Abayomi
 http://www.appdesignvault.com/
 
 Modified work Copyright (c) 2013 Corrado Ubezio
 https://github.com/corerd/
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "ADVViewController.h"


@implementation ADVViewController
{
    NSArray* percentProgressBars;
    NSArray* integralProgressBars;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    ADVPercentProgressBar *blueprogressBar =
    [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 30, 292, 56)
                             andProgressBarColor:ADVProgressBarBlue];
    
    [blueprogressBar setShowPercent:NO];
    [blueprogressBar setMinProgressValue:0];
    [blueprogressBar setMaxProgressValue:500];
    [blueprogressBar setProgress:[blueprogressBar minProgressValue] +
                        ([blueprogressBar maxProgressValue] -
                         [blueprogressBar minProgressValue])/2
     ];
    
    [self.view addSubview:blueprogressBar];
    
    
    ADVPercentProgressBar *greenprogressBar =
    [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 90, 292, 28)
                             andProgressBarColor:ADVProgressBarGreen];    
    [greenprogressBar setProgress:0.5];
    
    [self.view addSubview:greenprogressBar];
    
    
    ADVPercentProgressBar *redProgressBar =
    [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 125, 292, 56)
                             andProgressBarColor:ADVProgressBarRed];
    
    [redProgressBar setShowPercent:NO];
    [redProgressBar setMinProgressValue:200];
    [redProgressBar setMaxProgressValue:400];
    [redProgressBar setProgress:[redProgressBar minProgressValue] +
                        ([redProgressBar maxProgressValue] -
                         [redProgressBar minProgressValue])/2
     ];
    
    [self.view addSubview:redProgressBar];
    
    
    ADVPercentProgressBar *brownProgressPar =
    [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 185, 292, 28)
                             andProgressBarColor:ADVProgressBarBrown];    
    [brownProgressPar setProgress:0.5];
    
    [self.view addSubview:brownProgressPar];
    
    
    [self.view setBackgroundColor:[UIColor colorWithHue:0.0
                                             saturation:0.0
                                             brightness:0.93
                                                  alpha:1.0]
     ];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ADVPercentProgressBar views loaded from storyboard
    // MUST be initilized here...
    
    
    [self.pbRangeValue setShowPercent:NO];
    [self.pbRangeValue setMinProgressValue:300];
    [self.pbRangeValue setMaxProgressValue:600];
    [self.pbRangeValue setProgressBarColor:ADVProgressBarRed];
    [self.pbRangeValue setProgress:[self.pbRangeValue minProgressValue] +
     ([self.pbRangeValue maxProgressValue]-[self.pbRangeValue minProgressValue])/2];

    self.pbRangePercent.progress = 0.5;

    integralProgressBars = [NSArray arrayWithObjects:blueprogressBar,
                                 redProgressBar, self.pbRangeValue, nil];
    
    percentProgressBars = [NSArray arrayWithObjects:greenprogressBar,
                                brownProgressPar, self.pbRangePercent, nil];
}

-(IBAction)sliderValueChanged:(UISlider*)sender
{
    for (ADVPercentProgressBar * valueProgressBar in integralProgressBars)
    {
        [valueProgressBar setProgress:[valueProgressBar minProgressValue] +
                        ([valueProgressBar maxProgressValue] -
                         [valueProgressBar minProgressValue]) * sender.value
         ];
    }
    for (ADVPercentProgressBar * percentProgressBar in percentProgressBars)
    {
        [percentProgressBar setProgress:sender.value];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
