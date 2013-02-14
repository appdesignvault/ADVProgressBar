//
//  ADVPercentProgressBar.m
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

#define PERCENT_VIEW_WIDTH      32
#define PERCENT_VIEW_MIN_HEIGHT 17
#define TOP_PADDING             7.0f
#define BOTTOM_PADDING          7.0f
#define LEFT_PADDING 5.0f
#define RIGHT_PADDING 3.0f

#import "ADVPercentProgressBar.h"


@implementation ADVPercentProgressBar
{
    UIView* percentView;
    UIImageView *bgImageView;
    UIImageView *progressImageView;
    UIImage *progressFillImage;
    
    BOOL customViewFromNIB;

}

@synthesize progress;

// Thanks to Cyrille
// http://stackoverflow.com/questions/6856879/iphone-getting-the-size-of-an-image-after-aspectft
- (CGSize)getScale:(CGSize)originalSize fitInSize:(CGSize)boxSize withMode:(UIViewContentMode)mode
{
    CGFloat sx = boxSize.width/originalSize.width;
    CGFloat sy = boxSize.height/originalSize.height;
    CGFloat s = 1.0;
    
    switch (self.contentMode) {
        case UIViewContentModeScaleAspectFit:
            s = fminf(sx, sy);
            return CGSizeMake(s, s);
            break;
            
        case UIViewContentModeScaleAspectFill:
            s = fmaxf(sx, sy);
            return CGSizeMake(s, s);
            break;
            
        case UIViewContentModeScaleToFill:
            return CGSizeMake(sx, sy);
            
        default:
            return CGSizeMake(s, s);
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        customViewFromNIB = NO;
    }
    return self;
}

- (void)ADVProgressBarDraw:(CGRect)frame withProgressBarColor:(ADVProgressBarColor)barColor
{
/*
    if (frame.size.height - TOP_PADDING - BOTTOM_PADDING < PERCENT_VIEW_MIN_HEIGHT) {
        NSLog(@"progressBarFrameInit: Frame heigh is too small to draw PercentView");
        return;
    }
    if ( (frame.size.width - LEFT_PADDING - RIGHT_PADDING) < PERCENT_VIEW_WIDTH ) {
        NSLog(@"progressBarFrameInit: Frame width is too small to draw PercentView");
        return;
    }
*/
    NSString* progressFillStr = [self getImageNameFromBarDefinition:barColor];
    progressFillImage = [UIImage imageNamed:progressFillStr];
    
    bgImageView = [[UIImageView alloc] initWithFrame:
                   CGRectMake(
                              0,
                              0,
                              frame.size.width,
                              frame.size.height )
                   ];
    
    [bgImageView setImage:[UIImage imageNamed:@"progress-track.png"]];
    
    [self addSubview:bgImageView];
    
    progressImageView = [[UIImageView alloc] initWithFrame:
                         CGRectMake(
                                    1,
                                    0,
                                    0,
                                    frame.size.height )
                         ];
    
    [self addSubview:progressImageView];

    CGSize bgImageScale;
    if (customViewFromNIB == YES) {
        bgImageScale = [self getScale:bgImageView.image.size
                            fitInSize:bgImageView.frame.size
                            withMode:self.contentMode
                        ];
    }
    else {
        bgImageScale = [self getScale:bgImageView.frame.size
                            fitInSize:bgImageView.image.size
                            withMode:self.contentMode
                        ];
    }
    
    CGFloat topPadding = TOP_PADDING;
    if (bgImageScale.height > 1) {
        topPadding *= bgImageScale.height;
    }

    CGFloat bgImageHeight = bgImageView.frame.size.height;
    if (bgImageScale.height < 1) {
        bgImageHeight -= (bgImageView.frame.size.height - topPadding) * bgImageScale.height;
    }

    CGFloat centerY = bgImageView.center.y;
    CGFloat percentViewY = topPadding + centerY - bgImageHeight / 2;
    CGFloat percentViewHeight = (centerY - percentViewY)*2;

    //percentView = [[UIView alloc] initWithFrame:CGRectMake(LEFT_PADDING, 6, 32, 17)];
    percentView = [[UIView alloc] initWithFrame:
                   CGRectMake(
                              LEFT_PADDING,
                              //TOP_PADDING,
                              percentViewY,
                              PERCENT_VIEW_WIDTH,
                              percentViewHeight )
                   ];
    
    //UIImageView* percentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 17)];
    UIImageView* percentImageView = [[UIImageView alloc] initWithFrame:
                                     CGRectMake(
                                                0,
                                                0,
                                                PERCENT_VIEW_WIDTH,
                                                percentViewHeight )
                                     ];
    
    [percentImageView setImage:[UIImage imageNamed:@"progress-count.png"]];
    
    //UILabel* percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 32, 17)];
    UILabel* percentLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(
                                        0,
                                        0,
                                        PERCENT_VIEW_WIDTH,
                                        percentViewHeight )
                             ];
    
    [percentLabel setTag:1];
    [percentLabel setText:@"0"];
    [percentLabel setBackgroundColor:[UIColor clearColor]];
    [percentLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [percentLabel setTextAlignment:UITextAlignmentCenter];
    [percentLabel setAdjustsFontSizeToFitWidth:YES];
    
    [percentView addSubview:percentImageView];
    [percentView addSubview:percentLabel];
    
    [self addSubview:percentView];
    
    self.progress = 0.0f;
    self.showPercent = YES;
    self.minProgressValue = 0.0f;
    self.maxProgressValue = 1.0f;
}


/*
 We support both initWithFrame and initWithCoder so that our view controller
 can add us via a nib or programatically.
 */

// Override initWithFrame: if you add the view programatically.
- (id)initWithFrame:(CGRect)frame andProgressBarColor:(ADVProgressBarColor)barColor
{
    
    if (self = [super initWithFrame:frame])
    {
        [self ADVProgressBarDraw:frame withProgressBarColor:barColor];
    }
    
    return self;
}


// Override initWithCoder: if you're loading it from a nib or storyboard.
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        customViewFromNIB = YES;
        [self ADVProgressBarDraw:self.frame withProgressBarColor:ADVProgressBarBlue];
    }
    
    return self;
}


// Override layoutSubviews
// This function gets called whenever the frame of the view changes.
/*
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (customViewFromNIB != YES) {
        return;
    }
    
    [self draw:self.frame withProgressBarColor:ADVProgressBarBlue];

}
*/

- (void)setProgress:(CGFloat)theProgress
{
    if (self.progress == theProgress) {
        return;
    }
    
    // check range and pin to its limits if required
    if (theProgress < self.minProgressValue) {
        theProgress = self.minProgressValue;
    }
    if (theProgress > self.maxProgressValue) {
        theProgress = self.maxProgressValue;
    }
    
    progress = theProgress;
    
    BOOL showPercent;
    if (self.maxProgressValue <= 1.0 || self.maxProgressValue >= 1000.0) {
        showPercent = YES;
    }
    else {
        showPercent = self.showPercent;
    }
    
    CGFloat percentProgress = (progress - self.minProgressValue) /
                        (self.maxProgressValue - self.minProgressValue);
    
    progressImageView.image = progressFillImage;
    
    CGRect frame = progressImageView.frame;
    
    frame.origin.x = 2;
    frame.origin.y = 2;
    frame.size.height = bgImageView.frame.size.height - 4;
    
    frame.size.width = (bgImageView.frame.size.width - 4) * percentProgress;
    
    progressImageView.frame = frame;
    
    CGRect percentFrame = percentView.frame;
    
    float percentViewWidth = percentView.frame.size.width;
    float leftEdge = (progressImageView.frame.size.width - percentViewWidth) - RIGHT_PADDING;
    
    percentFrame.origin.x = (leftEdge < LEFT_PADDING) ? LEFT_PADDING : leftEdge;
    percentView.frame = percentFrame;
    
    UILabel* percentLabel = (UILabel*)[percentView viewWithTag:1];
    if (showPercent == YES) {
        // show percent
        if (percentProgress > 0) {
            [percentLabel setText:
                [NSString  stringWithFormat:@"%d%%", (int)(percentProgress*100)]];
        }
        else {
            [percentLabel setText:@"0"];
        }
    }
    else {
        // show integral
        [percentLabel setText:[NSString  stringWithFormat:@"%d", (int)progress]];
    }
}

-(NSString*)getImageNameFromBarDefinition:(ADVProgressBarColor)barDef
{
    NSString* imageName;
    
    switch (barDef) {
        case ADVProgressBarBlue:
            imageName = @"progress-fill-blue.png";
            break;
        case ADVProgressBarRed:
            imageName = @"progress-fill-red.png";
            break;
        case ADVProgressBarBrown:
            imageName = @"progress-fill-brown.png";
            break;
        case ADVProgressBarGreen:
            imageName = @"progress-fill-green.png";
            break;
        default:
            imageName = @"progress-fill-green.png";
            break;
    }
    
    return imageName;
}





@end
