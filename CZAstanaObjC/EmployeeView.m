//
//  ApplicantView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/17/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "EmployeeView.h"
#import "UIImage+CustomImage.h"
#import "UIColor+CustomColor.h"
#import "UIFont+CustomFont.h"

@implementation EmployeeView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.width, screenBounds.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.view];
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.width, screenBounds.height/8)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setFrame:self.headerView.frame];
    gradientLayer.colors = @[(id)[UIColor violetColorOne].CGColor, (id)[UIColor violetColorOne].CGColor];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    [self.headerView.layer insertSublayer:gradientLayer atIndex:0];
    [self addSubview:self.headerView];
    
    self.closeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.height*0.05, screenBounds.height*0.058, screenBounds.height*0.02, screenBounds.height*0.02)];
    [self.closeImageView setContentMode:UIViewContentModeScaleToFill];
    self.closeImageView.image = [UIImage closeImage];
    [self addSubview:self.closeImageView];
    
    self.employeeLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.23, screenBounds.height*0.016, screenBounds.width*0.57, screenBounds.height*0.1)];
    self.employeeLabel.font = [UIFont helveticaNeueBig];
    self.employeeLabel.textColor = [UIColor whiteColor];
    self.employeeLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.employeeLabel];
    
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, screenBounds.height/8, screenBounds.height/8)];
    [self.backButton addTarget:self action:@selector(leftArrowButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backButton];
    
    self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.width*0.066, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    self.rightImageView.image = [UIImage interviewImage];
    self.rightImageView.layer.cornerRadius = 5;
    self.rightImageView.clipsToBounds = YES;
    [self addSubview:self.rightImageView];
    
    self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.116, screenBounds.height*0.23, screenBounds.width*0.3, screenBounds.height*0.05)];
    self.rightLabel.backgroundColor = [[UIColor skyBlueColor] colorWithAlphaComponent:0.5];
    self.rightLabel.font = [UIFont helveticaLightSmall];
    self.rightLabel.textColor = [UIColor whiteColor];
    self.rightLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.rightLabel];
    
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(screenBounds.width*0.066, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    [self addSubview:self.rightButton];
    
    self.dutyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.width*0.532, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    self.dutyImageView.image = [UIImage resumeImage];
    self.dutyImageView.layer.cornerRadius = 5;
    self.dutyImageView.clipsToBounds = YES;
    [self addSubview:self.dutyImageView];
    
    self.dutyLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.582, screenBounds.height*0.23, screenBounds.width*0.3, screenBounds.height*0.05)];
    self.dutyLabel.backgroundColor = [[UIColor skyBlueColor] colorWithAlphaComponent:0.5];
    self.dutyLabel.font = [UIFont helveticaLightSmall];
    self.dutyLabel.textColor = [UIColor whiteColor];
    self.dutyLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.dutyLabel];
    
    self.dutyButton = [[UIButton alloc] initWithFrame:CGRectMake(screenBounds.width*0.532, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    [self addSubview:self.dutyButton];
    
    self.chooseLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.066, screenBounds.height*0.29, screenBounds.width, screenBounds.height*0.1)];
    self.chooseLabel.font = [UIFont helveticaLightBig];
    self.chooseLabel.textColor = [UIColor blackColor];
    [self addSubview:self.chooseLabel];
    
    self.descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(screenBounds.width*0.060, screenBounds.height*0.37, screenBounds.width*0.868, screenBounds.height*0.6)];
    self.descriptionTextView.font = [UIFont resumeTextHelveticaLight];
    [self.descriptionTextView setScrollEnabled:true];
    [self.descriptionTextView setEditable:false];
    self.descriptionTextView.textColor = [UIColor darkGrayColor];
    [self addSubview:self.descriptionTextView];
}

-(void)leftArrowButtonPressed {
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window.rootViewController dismissViewControllerAnimated:true completion:nil];
}

@end
