//
//  ApplicantView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/17/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "ApplicantView.h"
#import "UIImage+CustomImage.h"
#import "UIColor+CustomColor.h"
#import "UIFont+CustomFont.h"
#import "NSString+CustomString.h"

@implementation ApplicantView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.width, screenBounds.height)];
    self.view.backgroundColor = [UIColor cellGrayColor];
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
    
    self.applicantLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.23, screenBounds.height*0.016, screenBounds.width*0.57, screenBounds.height*0.1)];
    self.applicantLabel.font = [UIFont helveticaNeueBig];
    self.applicantLabel.textColor = [UIColor whiteColor];
    self.applicantLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.applicantLabel];
    
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, screenBounds.height/8, screenBounds.height/8)];
    [self.backButton addTarget:self action:@selector(leftArrowButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backButton];
    
    self.interviewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.width*0.066, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    self.interviewImageView.image = [UIImage interviewImage];
    self.interviewImageView.layer.cornerRadius = 5;
    self.interviewImageView.clipsToBounds = YES;
    [self addSubview:self.interviewImageView];
    
    self.interviewLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.116, screenBounds.height*0.23, screenBounds.width*0.3, screenBounds.height*0.05)];
    self.interviewLabel.backgroundColor = [[UIColor skyBlueColor] colorWithAlphaComponent:0.5];
    self.interviewLabel.font = [UIFont helveticaLightSmall];
    self.interviewLabel.textColor = [UIColor whiteColor];
    self.interviewLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.interviewLabel];
    
    self.interviewButton = [[UIButton alloc] initWithFrame:CGRectMake(screenBounds.width*0.066, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    [self addSubview:self.interviewButton];
    
    self.resumeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.width*0.532, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    self.resumeImageView.image = [UIImage resumeImage];
    self.resumeImageView.layer.cornerRadius = 5;
    self.resumeImageView.clipsToBounds = YES;
    [self addSubview:self.resumeImageView];
    
    self.resumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.582, screenBounds.height*0.23, screenBounds.width*0.3, screenBounds.height*0.05)];
    self.resumeLabel.backgroundColor = [[UIColor skyBlueColor] colorWithAlphaComponent:0.5];
    self.resumeLabel.font = [UIFont helveticaLightSmall];
    self.resumeLabel.textColor = [UIColor whiteColor];
    self.resumeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.resumeLabel];
    
    self.resumeButton = [[UIButton alloc] initWithFrame:CGRectMake(screenBounds.width*0.532, screenBounds.height*0.15, screenBounds.width*0.4, screenBounds.height*0.15)];
    [self addSubview:self.resumeButton];

    self.chooseLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.066, screenBounds.height*0.29, screenBounds.width, screenBounds.height*0.1)];
    self.chooseLabel.font = [UIFont helveticaLightBig];
    self.chooseLabel.textColor = [UIColor blackColor];
    [self addSubview:self.chooseLabel];
    
    self.descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(screenBounds.width*0.060, screenBounds.height*0.37, screenBounds.width*0.868, screenBounds.height*0.6)];
    self.descriptionTextView.font = [UIFont resumeTextHelveticaLight];
    [self.descriptionTextView setScrollEnabled:true];
    [self.descriptionTextView setEditable:false];
    self.descriptionTextView.textColor = [UIColor darkGrayColor];
    self.descriptionTextView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.descriptionTextView];
}

-(void)leftArrowButtonPressed {
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
