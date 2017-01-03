//
//  VacancyView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/27/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "VacancyView.h"
#import "UIFont+CustomFont.h"
#import "UIImage+CustomImage.h"
#import "UIColor+CustomColor.h"

@implementation VacancyView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
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
    
    self.categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.23, screenBounds.height*0.06, screenBounds.width*0.57, screenBounds.height*0.05)];
    self.categoryLabel.text = @"Категория";
    self.categoryLabel.font = [UIFont dateHelveticaLight];
    self.categoryLabel.textColor = [UIColor categoryColor];
    self.categoryLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.categoryLabel];
    
    self.categoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.width*0.23, screenBounds.height*0.005, screenBounds.width*0.57, screenBounds.height*0.1)];
    self.categoryNameLabel.font = [UIFont helveticaNeueBig];
    self.categoryNameLabel.textColor = [UIColor whiteColor];
    self.categoryNameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.categoryNameLabel];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, screenBounds.height/8, screenBounds.height/8)];
    [self.closeButton addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    
    self.vacancyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.height*0.05, screenBounds.height*0.15, screenBounds.height*0.025, screenBounds.height*0.025)];
    [self.vacancyImageView setContentMode:UIViewContentModeScaleToFill];
    self.vacancyImageView.image = [UIImage vacancyImage];
    [self addSubview:self.vacancyImageView];
    
    self.jobTitleTextView = [[UITextView alloc] initWithFrame:CGRectMake(frameBounds.height/8, frameBounds.height*0.14, frameBounds.width*0.7, frameBounds.width*0.18)];
    self.jobTitleTextView.textAlignment = NSTextAlignmentLeft;
    self.jobTitleTextView.font = [UIFont resumeTextHelveticaLight];
    self.jobTitleTextView.text = @"djhadaldlakj kadkajsdjakjdkajs knadkajsdkjakjdjaksjd kajdkajskdjakdjs akdjasdj";
    [self.jobTitleTextView sizeToFit];
    [self.jobTitleTextView setScrollEnabled:false];
    [self.jobTitleTextView setEditable:false];
    self.jobTitleTextView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.jobTitleTextView];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frameBounds.height*0.36, frameBounds.width, frameBounds.height*0.04)];
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    self.dateLabel.font = [UIFont resumeTextHelveticaLight];
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    self.dateLabel.text = @"27 December 2017";
    [self addSubview:self.dateLabel];
    
    self.dateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.height*0.06, screenBounds.height*0.2, screenBounds.height*0.025, screenBounds.height*0.025)];
    [self.dateImageView setContentMode:UIViewContentModeScaleToFill];
    self.dateImageView.image = [UIImage eventImage];
    [self addSubview:self.dateImageView];
    
    self.descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(frameBounds.width*0.2, frameBounds.height*0.15, frameBounds.width*0.7, frameBounds.height*0.5)];
    self.descriptionTextView.text = @"gdjhakdaadsl;  wanted to share with you, my concept iOS app for finding jobs. The Sketch file contains two views, Find Jobs and Job Details. I hope you like it or find it useful.";
    self.descriptionTextView.font = [UIFont resumeTextHelveticaLight];
    self.descriptionTextView.backgroundColor = [UIColor clearColor];
    [self.descriptionTextView setEditable:NO];
    [self addSubview:self.descriptionTextView];
    
    self.descriptionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.height*0.05, screenBounds.height*0.2, screenBounds.height*0.025, screenBounds.height*0.025)];
    [self.descriptionImageView setContentMode:UIViewContentModeScaleToFill];
    self.descriptionImageView.image = [UIImage textImage];
    [self addSubview:self.descriptionImageView];
}

-(void)closeButtonPressed {
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
