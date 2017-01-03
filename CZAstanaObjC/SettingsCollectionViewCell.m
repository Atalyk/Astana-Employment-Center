//
//  SettingsCollectionViewCell.m
//  CZAstanaObjC
//
//  Created by Admin on 12/24/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "SettingsCollectionViewCell.h"
#import "UIImage+CustomImage.h"
#import "UIFont+CustomFont.h"
#import "UIColor+CustomColor.h"
#import "NSString+CustomString.h"

@implementation SettingsCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    _picImageView = [[UIImageView alloc]
                     initWithFrame:CGRectMake(frameBounds.width*0.5-frameBounds.height*0.4, 0, frameBounds.height*0.8, frameBounds.height*0.8)];
    _picImageView.contentMode = UIViewContentModeScaleAspectFill;
    _picImageView.image = [UIImage welcomeImageOne];
    [self addSubview:_picImageView];
    
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frameBounds.height*0.75, frameBounds.width, frameBounds.height*0.1)];
    _detailLabel.text = [[NSString applicantKaz] uppercaseString];
    _detailLabel.font = [UIFont resumeTextHelveticaLight];
    _detailLabel.textColor = [UIColor grayColor];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.numberOfLines = 0;
    [self addSubview:_detailLabel];
}

@end
