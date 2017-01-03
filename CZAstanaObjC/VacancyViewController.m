//
//  VacancyViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/27/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "VacancyViewController.h"
#import "VacancyView.h"
#import "Masonry/Masonry.h"

@interface VacancyViewController ()

@property (nonatomic) CGSize screenBounds;

@end

@implementation VacancyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

-(void)setup {
    
    self.screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.vacancyView = [[VacancyView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height)];
    [self.view addSubview:self.vacancyView];
    
    [self updateViewConstraints];
    
    [self loadData];
}

-(void)loadData {
    
    self.vacancyView.categoryNameLabel.text = self.categoryName;
    self.vacancyView.jobTitleTextView.text = self.vacancyName;
    self.vacancyView.dateLabel.text = self.dateText;
    self.vacancyView.descriptionTextView.text = self.descriptionText;
    [self.vacancyView.jobTitleTextView sizeToFit];
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self.vacancyView.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vacancyView.jobTitleTextView.mas_bottom).with.offset(10);
        make.width.mas_equalTo(self.screenBounds.width*0.7);
        make.left.equalTo(self.vacancyView.jobTitleTextView.mas_left).with.offset(self.screenBounds.width*0.01);
        make.height.mas_equalTo(self.screenBounds.height*0.05);
    }];
    
    [self.vacancyView.descriptionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vacancyView.dateLabel.mas_bottom).with.offset(10);
        make.width.mas_equalTo(self.screenBounds.width*0.7);
        make.left.equalTo(self.vacancyView.jobTitleTextView.mas_left);
        make.height.mas_equalTo(self.screenBounds.height*0.5);
    }];
    
    [self.vacancyView.descriptionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vacancyView.vacancyImageView);
        make.top.equalTo(self.vacancyView.descriptionTextView.mas_top).with.offset(self.screenBounds.height*0.015);
        make.width.mas_equalTo(self.screenBounds.height*0.02);
        make.height.mas_equalTo(self.screenBounds.height*0.02);
    }];
    
    [self.vacancyView.dateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vacancyView.vacancyImageView);
        make.top.equalTo(self.vacancyView.dateLabel.mas_top).with.offset(self.screenBounds.height*0.015);
        make.width.mas_equalTo(self.screenBounds.height*0.02);
        make.height.mas_equalTo(self.screenBounds.height*0.02);
    }];
}

@end
