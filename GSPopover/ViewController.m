//
//  ViewController.m
//  GSPopover
//
//  Created by 鑫容 郭 on 12-7-21.
//  Copyright (c) 2012年 FoOTOo. All rights reserved.
//

#import "ViewController.h"
#import "GSPopOverBarButtonItem.h"

@interface ViewController ()

@property (strong, nonatomic) GSPopOverBarButtonItem *popOverBarButtonItem;

@end

@implementation ViewController

@synthesize popOverBarButtonItem = _popOverBarButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

- (UIImage *)backgroundImageWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor {
    CGFloat scale = isRetina ? 2.0f : 1.0f;
    
    UIGraphicsBeginImageContext(CGSizeMake(20 * scale, 44 * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0 * scale, 0 * scale, 19 * scale, 43 * scale) cornerRadius:6 * scale];
    
    CGAffineTransform ctm = CGAffineTransformMakeTranslation(0.5 * scale, 0.5 * scale);
    CGContextConcatCTM(context, ctm);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, bezierPath.CGPath);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, bezierPath.CGPath);
    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    CGContextSetLineWidth(context, 1 * scale);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    image = [UIImage imageWithCGImage:image.CGImage scale:scale orientation:UIImageOrientationUp];
    //return image;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 7, 0, 7)];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.popOverBarButtonItem = [[GSPopOverBarButtonItem alloc] initWithTitle:@"PopOver" style:UIBarButtonItemStyleBordered popOverBounds:CGRectMake(0, 0, 200, 80) baseView:self.navigationController.view];
    
    [self.navigationItem setRightBarButtonItem:_popOverBarButtonItem];
    
    UIView *popOverView = _popOverBarButtonItem.popOverView;
    
    UIButton *fontSmaller = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //[fontSmaller.layer setBorderColor:[[UIColor redColor] CGColor]];
    //[fontSmaller.layer setBorderWidth:2];
    
    [fontSmaller setTitle:@"＋" forState:UIControlStateNormal];
    [fontSmaller setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fontSmaller setBackgroundImage:[self backgroundImageWithStrokeColor:[UIColor grayColor] fillColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [fontSmaller setBackgroundImage:[self backgroundImageWithStrokeColor:[UIColor grayColor] fillColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
    [fontSmaller setFrame:CGRectMake(11, 27, 80, 44)];
    
    
    UIButton *fontBigger = [UIButton buttonWithType:UIButtonTypeCustom];
    [fontBigger setTitle:@"－" forState:UIControlStateNormal];
    [fontBigger setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fontBigger setBackgroundImage:[self backgroundImageWithStrokeColor:[UIColor grayColor] fillColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [fontBigger setBackgroundImage:[self backgroundImageWithStrokeColor:[UIColor grayColor] fillColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
    [fontBigger setFrame:CGRectMake(11 + 80 + 18, 27, 80, 44)];
    
    [popOverView addSubview:fontSmaller];
    [popOverView addSubview:fontBigger];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_popOverBarButtonItem hidePopOver];
}

@end
