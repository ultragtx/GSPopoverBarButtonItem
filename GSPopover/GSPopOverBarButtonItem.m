//
//  GSBarButtonItemWithPopOver.m
//  Labrador
//
//  Created by 鑫容 郭 on 12-7-1.
//  Copyright (c) 2012年 FoOTOo. All rights reserved.
//

#import "GSPopOverBarButtonItem.h"
#import "GSPopOverView.h"
#import <QuartzCore/QuartzCore.h>

@interface GSPopOverBarButtonItem ()

@property (assign, nonatomic) CGRect bounds;
@property (assign, nonatomic) BOOL popOverShowUp;

@end

@implementation GSPopOverBarButtonItem

@synthesize popOverView = _popOverView;
@synthesize bounds = _bounds;
@synthesize popOverShowUp = _popOverShowUp;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style popOverBounds:(CGRect)bounds {
    self = [super initWithTitle:title style:style target:self action:@selector(barButtonTouchUpInside:event:)];
    if (self) {
        self.bounds = bounds;
        
        self.popOverView = [[GSPopOverView alloc] initWithBounds:bounds];
        [(GSPopOverView *)_popOverView setDelegate:self];
        
        self.popOverShowUp = NO;
        
        
        
    }
    return self;
}

- (void)barButtonTouchUpInside:(id)sender event:(UIEvent *)event{
    
    if (_popOverShowUp) {
        [self hidePopOver];
    }
    else {
        UIView *view = [[[event allTouches] anyObject] view];
        //[view.layer setBorderColor:[[UIColor redColor] CGColor]];
        //[view.layer setBorderWidth:2];
        //DLog(@"%@", NSStringFromCGRect(view.frame));
        
        CGPoint point = CGPointMake(floorf(view.frame.size.width / 2), floorf(CGRectGetMaxY(view.frame) - 7));
        
        UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
        
        //[appWindow.layer setBorderColor:[[UIColor redColor] CGColor]];
        //[appWindow.layer setBorderWidth:2];
        
        CGPoint convertedPoint = [view convertPoint:point toView:appWindow];
        
        [(GSPopOverView *)_popOverView setPoint:convertedPoint];
        
        [appWindow addSubview:_popOverView];
        
        self.popOverShowUp = YES;
        
        //UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, @"出现浮动窗口");
    }
}

- (void)hidePopOver {
    [_popOverView removeFromSuperview];
    self.popOverShowUp = NO;
}

#pragma mark - GSPopOverView Delegate

- (void)popOverViewTouchOutside:(GSPopOverView *)popOverView {
    [self hidePopOver];
}

@end
