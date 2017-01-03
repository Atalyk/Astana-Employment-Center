//
//  JobTableViewCell.h
//  CZAstanaObjC
//
//  Created by Admin on 12/13/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobTableViewCell : UITableViewCell

@property (nonatomic) UIView *circleView;
@property (nonatomic) UIView *lineView;
@property (nonatomic) UILabel *jobTitleLabel;
@property (nonatomic) UILabel *jobDescriptionLabel;
@property (nonatomic) UILabel *jobLetterLabel;
@property (nonatomic) UILabel *jobDateLabel;
@property (nonatomic) UIImageView *titleImageView;
@property (nonatomic) UIImageView *descriptionImageView;
@property (nonatomic) UIView *dateCircleView;

@end
