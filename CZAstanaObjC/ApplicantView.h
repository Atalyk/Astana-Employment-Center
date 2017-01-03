//
//  ApplicantView.h
//  CZAstanaObjC
//
//  Created by Admin on 12/17/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicantView : UIView

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIView *view;
@property (nonatomic) UILabel *applicantLabel;
@property (nonatomic) UIImageView *interviewImageView;
@property (nonatomic) UIButton *interviewButton;
@property (nonatomic) UIButton *resumeButton;
@property (nonatomic) UIImageView *resumeImageView;
@property (nonatomic) UILabel *interviewLabel;
@property (nonatomic) UILabel *resumeLabel;
@property (nonatomic) UILabel *chooseLabel;
@property (nonatomic) UITextView *descriptionTextView;
@property (nonatomic) UIButton *backButton;
@property (nonatomic) UIImageView *closeImageView;
@property (nonatomic) UIView *headerView;

@end
