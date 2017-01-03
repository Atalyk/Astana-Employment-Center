//
//  ApplicantViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/17/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "ApplicantViewController.h"
#import "ApplicantView.h"
#import "MainViewController.h"
#import "NSString+CustomString.h"
#import "SettingsViewController.h"

@interface ApplicantViewController ()

@property (nonatomic) ApplicantView *applicantView;
@property (nonatomic) CGSize screenBounds;

@end

@implementation ApplicantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loadDataForLanguage];
}

-(void)setup {
    
    self.screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.applicantView = [[ApplicantView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height)];
    [self.applicantView.interviewButton addTarget:self action:@selector(interviewButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.applicantView.resumeButton addTarget:self action:@selector(resumeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.applicantView];
}

-(void)loadDataForLanguage {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.applicantView.applicantLabel.text = [NSString applicantKaz];
        self.applicantView.interviewLabel.text = [NSString interviewChooseLabelKaz];
        self.applicantView.resumeLabel.text = [NSString resumeChooseLabelKaz];
        self.applicantView.chooseLabel.text =  [NSString interviewChooseLabelKaz];
        self.applicantView.descriptionTextView.text = [NSString applicantsInterviewStringKaz];
    } else {
        self.applicantView.applicantLabel.text = [NSString applicantRus];
        self.applicantView.interviewLabel.text = [NSString interviewChooseLabelRus];
        self.applicantView.resumeLabel.text = [NSString resumeChooseLabelRus];
        self.applicantView.chooseLabel.text =  [NSString interviewChooseLabelRus];
        self.applicantView.descriptionTextView.text = [NSString applicantsInterviewStringRus];
    }
}

-(void)interviewButtonPressed {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.applicantView.chooseLabel.text = [NSString interviewChooseLabelKaz];
        self.applicantView.descriptionTextView.text = [NSString applicantsInterviewStringKaz];
    } else {
        self.applicantView.chooseLabel.text = [NSString interviewChooseLabelRus];
        self.applicantView.descriptionTextView.text = [NSString applicantsInterviewStringRus];
    }
}

-(void)resumeButtonPressed {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.applicantView.chooseLabel.text = [NSString resumeChooseLabelKaz];
        self.applicantView.descriptionTextView.text = [NSString applicantsResumeStringKaz];
    } else {
        self.applicantView.chooseLabel.text = [NSString resumeChooseLabelRus];
        self.applicantView.descriptionTextView.text = [NSString applicantsResumeStringRus];
    }
}

@end
