//
//  GSBarButtonItemWithPopOver.h
//  Labrador
//
//  Created by 鑫容 郭 on 12-7-1.
//  Copyright (c) 2012年 FoOTOo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSPopOverView.h"

@interface GSPopOverBarButtonItem : UIBarButtonItem <GSPopOverViewDelegate>

@property (strong, nonatomic) UIView *popOverView;
@property (readonly, nonatomic) BOOL popOverShowUp;
@property (unsafe_unretained, nonatomic) UIView *baseView;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style popOverBounds:(CGRect)bounds baseView:(UIView *)baseView;

- (void)hidePopOver;

@end
