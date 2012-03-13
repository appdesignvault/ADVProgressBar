//
//  ADVPercentProgressBar.m
//  ADVProgressBar
//
//
/*
 The MIT License
 
 Copyright (c) 2011 Tope Abayomi
 http://www.appdesignvault.com/
 
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

#define LEFT_PADDING 5.0f
#define RIGHT_PADDING 3.0f

#import "ADVPercentProgressBar.h"
#import "ADVAppDelegate.h"

@implementation ADVPercentProgressBar

@synthesize progress;


- (id)initWithFrame:(CGRect)frame andProgressBarColor:(ADVProgressBarColor)barColor
{
    
    if (self = [super initWithFrame:frame]) 
    {
        
        NSString* progressFillStr = [self getImageNameFromBarDefinition:barColor];
        
        progressFillImage = [UIImage imageNamed:progressFillStr];
        
        bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [bgImageView setImage:[UIImage imageNamed:@"progress-track.png"]];
        
        [self addSubview:bgImageView];
        
        progressImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 0, 0, frame.size.height)];
        
        [self addSubview:progressImageView];
        
        percentView = [[UIView alloc] initWithFrame:CGRectMake(LEFT_PADDING, 6, 32, 17)];
        
        UIImageView* percentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 17)];
        
        [percentImageView setImage:[UIImage imageNamed:@"progress-count.png"]];
        
        UILabel* percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 32, 17)];
        
        [percentLabel setTag:1];
        [percentLabel setText:@"0%"];
        [percentLabel setBackgroundColor:[UIColor clearColor]];
        [percentLabel setFont:[UIFont boldSystemFontOfSize:13]];
        [percentLabel setTextAlignment:UITextAlignmentCenter];
        [percentLabel setAdjustsFontSizeToFitWidth:YES];
        
        [percentView addSubview:percentImageView];
        [percentView addSubview:percentLabel];
        
        [self addSubview:percentView];
        
        self.progress = 0.0f;
    }
    
    return self;
}


- (void)setProgress:(CGFloat)theProgress {
    
    if (self.progress != theProgress) {
        
        if (theProgress >= 0 && theProgress <= 1) {
            
            progress = theProgress;
            
            progressImageView.image = progressFillImage;
            
            CGRect frame = progressImageView.frame;
            
            frame.origin.x = 2;
            frame.origin.y = 2;
            frame.size.height = bgImageView.frame.size.height - 4;
            
            frame.size.width = (bgImageView.frame.size.width - 4) * progress;
            
            progressImageView.frame = frame;
            
            CGRect percentFrame = percentView.frame;
            
            float percentViewWidth = percentView.frame.size.width;
            float leftEdge = (progressImageView.frame.size.width - percentViewWidth) - RIGHT_PADDING;
            
            percentFrame.origin.x = (leftEdge < LEFT_PADDING) ? LEFT_PADDING : leftEdge;
            percentView.frame = percentFrame;
            
            UILabel* percentLabel = (UILabel*)[percentView viewWithTag:1];
            [percentLabel setText:[NSString  stringWithFormat:@"%d%%", (int)(progress*100)]];
            
        }
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
