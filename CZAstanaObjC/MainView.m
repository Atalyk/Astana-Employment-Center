//
//  MainView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/13/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "MainView.h"
#import "UIFont+CustomFont.h"
#import "UIColor+CustomColor.h"
#import "UIImage+CustomImage.h"

@implementation MainView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
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
    
    self.menuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.height*0.05, screenBounds.height*0.06, screenBounds.height*0.02, screenBounds.height*0.025)];
    [self.menuImageView setContentMode:UIViewContentModeScaleToFill];
    self.menuImageView.image = [UIImage menuImage];
    [self addSubview:self.menuImageView];
    
    self.categoryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenBounds.width*0.87, screenBounds.height*0.06, screenBounds.height*0.025, screenBounds.height*0.025)];
    [self.categoryImageView setContentMode:UIViewContentModeScaleToFill];
    self.categoryImageView.image = [UIImage controlImage];
    [self addSubview:self.categoryImageView];
    
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
    
    self.menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, screenBounds.height/8, screenBounds.height/8)];
    [self addSubview:self.menuButton];
    
    self.categoryButton = [[UIButton alloc] initWithFrame:CGRectMake(screenBounds.width-screenBounds.height/8, 0, screenBounds.height/8, screenBounds.height/8)];
    self.categoryButton.backgroundColor = [UIColor clearColor];
    [self addSubview:self.categoryButton];
}

@end
