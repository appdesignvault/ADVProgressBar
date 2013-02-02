//
//  ADVPercentProgressBar.h
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
 ADVPercentProgressBar depicts the progress of a task over time.
 
 The amount of `progress` is displayed by a horizontal bar,
 called `progressImageView`, that represents a range of values.
 This range is controlled by the `minProgressValue` and the `maxProgressValue`
 properties, whose default values are 0.0 and 1.0 respectively.
 
 The user can customize the appearance of the `progressImageView` horizontal bar
 selecting its color in the `ADVProgressBarColor` set.
 
 The current `progress` is represented by a floating-point value (default 0.0)
 between `minProgressValue` and `maxProgressValue`, inclusive;
 values less or greater are pinned to those limits.
 
 The current `progress` is shown by the position of a cursor, coupled with
 the `progressImageView` and called `percentView`; within its bounds, it is
 shown a textual indication of the amount of the task that has completed.
 The way this indication is displayed, is controlled by the `showPercentage`
 property: by default its value is `true` and the current `progress` is
 formatted as a percent complete respect the range of values.
 
 The user can set to `false` the `showPercentage` property to display the integral
 amount of the task that has completed.
 Since the width of the `progressImageView` cursor is fixed to 3 textual
 characters wide, if `maxProgressValue` is greater than 999, then the current
 `progress` is formatted as a percent even if the `showPercentage` property
 is set to `false`.
 
 The `showPercentage` property isn't taken in account also when the
 `maxProgressValue` is less or equal to 1.0: the current `progress` will be
 always formatted as a percent.
 */

#import <Foundation/Foundation.h>

// Types

/// Set of `progressImageView` horizontal bar colors.
typedef enum
{       
    ADVProgressBarGreen,
    ADVProgressBarRed,
    ADVProgressBarBrown,
    ADVProgressBarBlue
} ADVProgressBarColor;


@interface ADVPercentProgressBar : UIView

// Properties

/// The current amount of the task that has completed (default 0.0).
@property (nonatomic, readwrite, assign) CGFloat progress;

/// Minimum in the range of `progress` values (default 0.0).
@property (nonatomic, readwrite, assign) CGFloat minProgressValue;

/// Maximum in the range of `progress` values (default 1.0).
@property (nonatomic, readwrite, assign) CGFloat maxProgressValue;

/// Toggle between percent or integral view of current `progress` (default `true`=percent)
@property (nonatomic, readwrite, assign) bool showPercent;

// Methods

/*!
 Initializes and returns a newly allocated `ADVPercentProgressBar` view object.
 
 The view is allocated with the specified frame rectangle and
 the `progressImageView` horizontal bar color.
 
 @param frame
    The frame rectangle for the view, measured in points.
    The origin of the frame is relative to the superview in which you plan to add it.
 
 @param barColor
    The `progressImageView` horizontal bar color in the `ADVProgressBarColor` set.
 
 @return
    An initialized `ADVPercentProgressBar` view object
    or nil if the object couldn't be created.
 */
- (id)initWithFrame:(CGRect)frame
andProgressBarColor:(ADVProgressBarColor)barColor;

@end
