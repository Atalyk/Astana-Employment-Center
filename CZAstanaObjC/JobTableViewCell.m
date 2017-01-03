//
//  JobTableViewCell.m
//  CZAstanaObjC
//
//  Created by Admin on 12/13/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "JobTableViewCell.h"
#import "UIColor+CustomColor.h"
#import "UIImage+CustomImage.h"
#import "UIFont+CustomFont.h"

@implementation JobTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    CGFloat frameWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat frameHeight = [UIScreen mainScreen].bounds.size.height*7/48;
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.jobTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameWidth*0.15, 0, frameWidth*0.83, frameHeight*0.5)];
    self.jobTitleLabel.font = [UIFont helveticaLightSmall];
    [self addSubview:self.jobTitleLabel];
    
    self.jobDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameWidth*0.18, frameHeight*0.21, frameWidth*0.83, frameHeight*0.6)];
    self.jobDescriptionLabel.font = [UIFont helveticaLightSmall];
    self.jobDescriptionLabel.textColor = [UIColor topicCellColor];
    [self addSubview:self.jobDescriptionLabel];
    
    self.jobDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameWidth*0.18, frameHeight*0.64, frameWidth*0.85, frameHeight*0.2)];
    self.jobDateLabel.font = [UIFont dateHelveticaLight];
    self.jobDateLabel.textColor = [UIColor topicCellColor];
    [self addSubview:self.jobDateLabel];
    
    self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameWidth*0.05, frameHeight*0.17, frameHeight*0.17, frameHeight*0.17)];
    self.titleImageView.image = [UIImage caseImage];
    [self addSubview:self.titleImageView];
    
    self.descriptionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameWidth*0.05, frameHeight*0.48, frameHeight*0.16, frameHeight*0.16)];
    self.descriptionImageView.image = [UIImage textImage];
    [self addSubview:self.descriptionImageView];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(frameWidth*0.165, frameHeight*0.4, frameWidth*0.005, frameHeight*0.42)];
    self.lineView.backgroundColor = [UIColor topicCellColor];
    [self addSubview:self.lineView];
}

@end
