//
//  ADVViewController.h
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

/*!
 ADVPercentProgressBar demo.
 
 Demonstrate how to create and instantiate a bunch of ADVPercentProgressBar
 custom views.
 They are added to the View Controller in the two ways:
 - programmatically;
 - from a nib or storyboard.
 */

#import <UIKit/UIKit.h>
#import "ADVPercentProgressBar.h"

@interface ADVViewController : UIViewController

/// An ADVPercentProgressBar showing the integral value.
@property (weak, nonatomic) IBOutlet ADVPercentProgressBar *pbRangeValue;

/// An ADVPercentProgressBar showing the percentage of the value.
@property (weak, nonatomic) IBOutlet ADVPercentProgressBar *pbRangePercent;


/*!
 Action on sliding.

 Get the value changed sliding along the track.
 
 The value is returned in the range 0.0 - 1.0 and is used to animate the
 ADVPercentProgressBar views.
 
 @param sender
    Slider that is sending the action message.
 */
- (IBAction)sliderValueChanged:(UISlider *)sender;


@end
