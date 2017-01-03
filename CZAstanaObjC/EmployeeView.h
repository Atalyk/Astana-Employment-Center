//
//  EmployeeView.h
//  CZAstanaObjC
//
//  Created by Admin on 12/18/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeView : UIView

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIView *view;
@property (nonatomic) UILabel *employeeLabel;
@property (nonatomic) UIImageView *rightImageView;
@property (nonatomic) UIImageView *dutyImageView;
@property (nonatomic) UIButton *rightButton;
@property (nonatomic) UIButton *dutyButton;
@property (nonatomic) UILabel *rightLabel;
@property (nonatomic) UILabel *dutyLabel;
@property (nonatomic) UILabel *chooseLabel;
@property (nonatomic) UITextView *descriptionTextView;
@property (nonatomic) UIButton *backButton;
@property (nonatomic) UIImageView *closeImageView;
@property (nonatomic) UIView *headerView;

@end
