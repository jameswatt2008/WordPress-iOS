//
//  WPNUXUtility.m
//  WordPress
//
//  Created by Sendhil Panchadsaram on 5/12/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import "WPNUXUtility.h"

@implementation WPNUXUtility

#pragma mark - Fonts

+ (UIFont *)textFieldFont
{
    return [UIFont fontWithName:@"OpenSans" size:16.0];
}

+ (UIFont *)descriptionTextFont
{
    return [UIFont fontWithName:@"OpenSans" size:15.0];
}

+ (UIFont *)titleFont
{
    return [UIFont fontWithName:@"OpenSans-Light" size:24];
}

+ (UIFont *)swipeToContinueFont
{
    return [UIFont fontWithName:@"OpenSans" size:10.0];
}

+ (UIFont *)tosLabelFont
{
    return [UIFont fontWithName:@"OpenSans" size:12.0];
}

+ (UIFont *)tosLabelSmallerFont
{
    return [UIFont fontWithName:@"OpenSans" size:9.0];
}

+ (UIFont *)confirmationLabelFont
{
    return [UIFont fontWithName:@"OpenSans" size:14];
}

#pragma mark - Colors

+ (UIColor *)bottomPanelLineColor
{
    return [UIColor colorWithRed:43/255.0f green:153/255.0f blue:193/255.0f alpha:1.0f];
}

+ (UIColor *)descriptionTextColor
{
    return [UIColor colorWithRed:187.0/255.0 green:221.0/255.0 blue:237.0/255.0 alpha:1.0];
}

+ (UIColor *)bottomPanelBackgroundColor
{
    return [self backgroundColor];
}

+ (UIColor *)swipeToContinueTextColor
{
    return [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.3];
}

+ (UIColor *)confirmationLabelColor
{
    return [UIColor colorWithRed:188.0/255.0 green:221.0/255.0 blue:236.0/255.0 alpha:1.0];
}

+ (UIColor *)backgroundColor
{
    return [UIColor colorWithRed:46.0/255.0 green:162.0/255.0 blue:204.0/255.0 alpha:1.0];
}

+ (UIColor *)tosLabelColor
{
    return [self descriptionTextColor];
}

+ (UIColor *)jetpackBackgroundColor
{
    return [UIColor colorWithRed:140.0/255.0 green:170.0/255.0 blue:70.0/255.0 alpha:1.0];
}

+ (UIColor *)jetpackDescriptionTextColor
{
    return [UIColor colorWithRed:225.0/255.0 green:232.0/255.0 blue:211.0/255.0 alpha:1.0];
}

#pragma mark - Helper Methods

+ (void)centerViews:(NSArray *)controls withStartingView:(UIView *)startingView andEndingView:(UIView *)endingView forHeight:(CGFloat)viewHeight
{
    CGFloat heightOfControls = CGRectGetMaxY(endingView.frame) - CGRectGetMinY(startingView.frame);
    CGFloat startingYForCenteredControls = floorf((viewHeight - heightOfControls)/2.0);
    CGFloat offsetToCenter = CGRectGetMinY(startingView.frame) - startingYForCenteredControls;
    
    for (UIControl *control in controls) {
        CGRect frame = control.frame;
        frame.origin.y -= offsetToCenter;
        control.frame = frame;
    }
}

+ (void)configurePageControlTintColors:(UIPageControl *)pageControl
{
    // This only works on iOS6+
    if ([pageControl respondsToSelector:@selector(pageIndicatorTintColor)]) {
        UIColor *currentPageTintColor =  [UIColor colorWithRed:187.0/255.0 green:221.0/255.0 blue:237.0/255.0 alpha:1.0];
        UIColor *pageIndicatorTintColor = [UIColor colorWithRed:38.0/255.0 green:151.0/255.0 blue:197.0/255.0 alpha:1.0];
        pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
        pageControl.currentPageIndicatorTintColor = currentPageTintColor;
    }
}

+ (NSAttributedString *)titleAttributedString:(NSString *)text {
    
    if (!(text.length > 0)) {
        return nil;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineHeightMultiple = 0.95;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName: [WPNUXUtility titleFont],
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 NSParagraphStyleAttributeName: paragraphStyle};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

@end
