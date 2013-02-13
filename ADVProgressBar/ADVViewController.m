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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    ADVPercentProgressBar *blueprogressBar = [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 30, 292, 100) andProgressBarColor:ADVProgressBarBlue];
    
    [blueprogressBar setShowPercent:NO];
    [blueprogressBar setMinProgressValue:0];
    [blueprogressBar setMaxProgressValue:500];
    [blueprogressBar setProgress:[blueprogressBar minProgressValue] +
                        ([blueprogressBar maxProgressValue]-[blueprogressBar minProgressValue])/2];
    
    [self.view addSubview:blueprogressBar];
    
    
    ADVPercentProgressBar *greenprogressBar = [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 80, 292, 28) andProgressBarColor:ADVProgressBarGreen];
    
    [greenprogressBar setProgress:0.5];
    
    [self.view addSubview:greenprogressBar];
    
    
    ADVPercentProgressBar *redProgressBar = [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 130, 292, 28) andProgressBarColor:ADVProgressBarRed];
    
    [redProgressBar setShowPercent:NO];
    [redProgressBar setMinProgressValue:200];
    [redProgressBar setMaxProgressValue:400];
    [redProgressBar setProgress:[redProgressBar minProgressValue] +
                        ([redProgressBar maxProgressValue]-[redProgressBar minProgressValue])/2];
    
    [self.view addSubview:redProgressBar];
    
    
    ADVPercentProgressBar *brownProgressPar = [[ADVPercentProgressBar alloc] initWithFrame:CGRectMake(10, 180, 292, 28) andProgressBarColor:ADVProgressBarBrown];
    
    [brownProgressPar setProgress:0.5];
    
    [self.view addSubview:brownProgressPar];
    
    
    self.integralProgressBars = [NSArray arrayWithObjects:blueprogressBar, redProgressBar, nil];
    
    self.percentProgressBars = [NSArray arrayWithObjects:greenprogressBar, brownProgressPar, nil];
    
    
    UISlider* slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 230, 292, 28)];
    
    [slider setMaximumValue:1.0];
    [slider setMinimumValue:0.0];
    [slider setValue:0.5];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:slider];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 280, 292, 28)];
    [label setText:@"Move the slider to see the Progress bars in action"];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:12]];
    
    [self.view addSubview:label];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 420, 320, 40)];
    
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setOpaque:NO];
    [webView setDelegate:self];
    [webView loadHTMLString:@"<a href='http://www.appdesignvault.com'>http://www.appdesignvault.com</a>" baseURL:nil];
    
    [self.view addSubview:webView];
    
    [self.view setBackgroundColor:[UIColor colorWithHue:0.0 saturation:0.0 brightness:0.93 alpha:1.0]];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.blueProgressBar.progress = 0.5;

}

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if ( inType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        return NO;
    }
    
    return YES;
}


-(IBAction)sliderValueChanged:(UISlider*)sender
{
    for (ADVPercentProgressBar * valueProgressBar in self.integralProgressBars)
    {
        [valueProgressBar setProgress:[valueProgressBar minProgressValue] +
                        ([valueProgressBar maxProgressValue]-[valueProgressBar minProgressValue]) * sender.value];
    }
    for (ADVPercentProgressBar * percentProgressBar in self.percentProgressBars)
    {
        [percentProgressBar setProgress:sender.value];
    }

    [self.blueProgressBar setProgress:sender.value];
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
