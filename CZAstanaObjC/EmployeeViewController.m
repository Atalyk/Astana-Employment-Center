//
//  EmployeeViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/22/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "EmployeeViewController.h"
#import "SettingsViewController.h"
#import "NSString+CustomString.h"
#import "EmployeeView.h"

@interface EmployeeViewController ()

@property (nonatomic) EmployeeView *employeeView;
@property (nonatomic) CGSize screenBounds;

@end

@implementation EmployeeViewController

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
    
    self.employeeView = [[EmployeeView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height)];
    [self.employeeView.rightButton addTarget:self action:@selector(rightButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.employeeView.dutyButton addTarget:self action:@selector(dutyButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.employeeView];
}

-(void)loadDataForLanguage {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.employeeView.employeeLabel.text = [NSString employeeKaz];
        self.employeeView.dutyLabel.text = [NSString dutyChooseLabelKaz];
        self.employeeView.rightLabel.text = [NSString rightChooseLabelKaz];
        self.employeeView.chooseLabel.text =  [NSString rightChooseLabelKaz];
        self.employeeView.descriptionTextView.text = [NSString employersRightsStringKaz];
    } else {
        self.employeeView.employeeLabel.text = [NSString applicantRus];
        self.employeeView.dutyLabel.text = [NSString dutyChooseLabelRus];
        self.employeeView.rightLabel.text = [NSString rightChooseLabelRus];
        self.employeeView.chooseLabel.text =  [NSString rightChooseLabelRus];
        self.employeeView.descriptionTextView.text = [NSString employersRightsStringRus];
    }
}

-(void)rightButtonPressed {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.employeeView.chooseLabel.text = [NSString rightChooseLabelKaz];
        self.employeeView.descriptionTextView.text = [NSString employersRightsStringKaz];
    } else {
        self.employeeView.chooseLabel.text = [NSString rightChooseLabelRus];
        self.employeeView.descriptionTextView.text = [NSString employersRightsStringRus];
    }
}

-(void)dutyButtonPressed {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.employeeView.chooseLabel.text = [NSString dutyChooseLabelKaz];
        self.employeeView.descriptionTextView.text = [NSString employersObligationStringKaz];
    } else {
        self.employeeView.chooseLabel.text = [NSString dutyChooseLabelRus];
        self.employeeView.descriptionTextView.text = [NSString employersObligationStringRus];
    }
}

@end
