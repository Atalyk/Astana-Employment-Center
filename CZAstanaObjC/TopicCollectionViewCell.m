//
//  TopicCollectionViewCell.m
//  CZAstanaObjC
//
//  Created by Admin on 12/12/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "TopicCollectionViewCell.h"
#import "UIImage+CustomImage.h"
#import "UIFont+CustomFont.h"
#import "UIColor+CustomColor.h"

@implementation TopicCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameBounds.height*0.25, frameBounds.height*0.275, frameBounds.height*0.45, frameBounds.height*0.45)];
    self.picImageView.image = [UIImage welcomeImageOne];
    [self.picImageView setContentMode:UIViewContentModeScaleToFill];
    [self addSubview:self.picImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameBounds.height*0.9, frameBounds.height*0.3, frameBounds.width*0.8, frameBounds.height*0.4)];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor topicCellColor];
    self.titleLabel.font = [UIFont resumeTextHelveticaLight];
    [self addSubview:self.titleLabel];
}

@end
