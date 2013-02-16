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
 Define a Custom UIView to depict the progress of a task over time.
 
 The amount of **progress** is displayed by a horizontal bar,
 called **progressImageView**, that represents a range of values.
 This range is controlled by the **minProgressValue** and the **maxProgressValue**
 properties, whose default values are 0.0 and 1.0 respectively.
 
 The user can customize the appearance of the **progressImageView** horizontal bar
 selecting its color in the **ADVProgressBarColor** set.
 
 The current **progress** is represented by a floating-point value (default 0.0)
 between **minProgressValue** and **maxProgressValue**, inclusive;
 values less or greater are pinned to those limits.
 
 The current **progress** is shown by the position of a cursor, coupled with
 the **progressImageView** and called **percentView**; within its bounds, it is
 shown a textual indication of the amount of the task that has completed.
 The way this indication is displayed, is controlled by the **showPercent**
 property: by default its value is `YES` and the current **progress** is
 formatted as a percent complete respect the range of values.
 
 The user can set to `NO` the **showPercent** property to display the integral
 amount of the task that has completed.
 Since the width of the **progressImageView** cursor is fixed to 3 textual
 characters wide, if **maxProgressValue** is greater than 999, then the current
 **progress** is formatted as a percent even if the **showPercent** property
 is set to `NO`.
 
 The **showPercent** property isn't taken in account also when the
 **maxProgressValue** is less or equal to 1.0: the current **progress** will be
 always formatted as a percent.
 
 This Custom UIView can be created and instantiated both in-code
 (programmatically) or via a nib (storyboard).
 For this reason, are supported both `initWithFrame:andProgressBarColor:` and
 `initWithCoder:` methods respectively.
 
 CREDITS
 
 [How is view initialized when loaded via a storyboard]
 (http://stackoverflow.com/questions/8373176/how-is-view-initialized-when-loaded-via-a-storyboard)
 
 [iPhone : Getting the size of an image after AspectFt]
 (http://stackoverflow.com/questions/6856879/iphone-getting-the-size-of-an-image-after-aspectft)
 */

#import <Foundation/Foundation.h>


@interface ADVPercentProgressBar : UIView

// Types

/// Set of **progressImageView** horizontal bar colors.
typedef enum
{
    ADVProgressBarGreen,
    ADVProgressBarRed,
    ADVProgressBarBrown,
    ADVProgressBarBlue
} ADVProgressBarColor;

// Properties

/// The current amount of the task that has completed (default 0.0).
@property (nonatomic, readwrite, assign) CGFloat progress;

/// The **progressImageView** horizontal bar color in the **ADVProgressBarColor** set
/// (default ADVProgressBarBlue).
@property (nonatomic, readwrite, assign) ADVProgressBarColor progressBarColor;

/// Minimum in the range of **progress** values (default 0.0).
@property (nonatomic, readwrite, assign) CGFloat minProgressValue;

/// Maximum in the range of **progress** values (default 1.0).
@property (nonatomic, readwrite, assign) CGFloat maxProgressValue;

/// Toggle between percent or integral view of current **progress**
/// (default `YES` = percent)
@property (nonatomic, readwrite, assign) BOOL showPercent;

// Methods

/*!
 Override `initWithFrame` if the view is added programmatically.
 
 Initializes and returns a newly allocated `ADVPercentProgressBar` view object.
 The view is allocated with the specified frame rectangle and
 the **progressImageView** horizontal bar color.
 
 @param frame
    The frame rectangle for the view, measured in points.
    The origin of the frame is relative to the superview in which you plan to add it.
 
 @param barColor
    The **progressImageView** horizontal bar color in the **ADVProgressBarColor** set.
 
 @return
    An initialized `ADVPercentProgressBar` view object
    or nil if the object couldn't be created.
 */
- (id)initWithFrame:(CGRect)frame
andProgressBarColor:(ADVProgressBarColor)barColor;


/*!
 Override `initWithCoder` if the view is loaded from a nib or storyboard.
 
 @param coder
    A nib or storyboard object.
 
 @return
    An `ADVPercentProgressBar` initialized from a nib or storyboard.
 */
- (id)initWithCoder:(NSCoder *)coder;

@end
