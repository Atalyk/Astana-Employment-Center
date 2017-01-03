//
//  MainViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/12/16.
//  Copyright © 2016 AAkash. All rights reserved.
//
#import "MMDrawerController/MMDrawerController.h"
#import "SettingsViewController.h"
#import "NSString+CustomString.h"
#import "VacancyViewController.h"
#import "CategoryTableViewCell.h"
#import "UIColor+CustomColor.h"
#import "MainViewController.h"
#import "UIFont+CustomFont.h"
#import "JobTableViewCell.h"
#import "DropDownView.h"
#import "HelperMethods.h"
#import "EmptyView.h"
#import <Parse/Parse.h>
#import "MainView.h"
#import "Vacancy.h"

@interface MainViewController ()

@property (nonatomic) MMDrawerController *mmDrawerController;
@property (nonatomic) MainView *mainView;
@property (nonatomic) CGSize screenBounds;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UITableView *dropTableView;
@property (nonatomic) NSArray *colors;
@property (nonatomic) NSInteger random;
@property (nonatomic) UIView  *blackView;
@property (nonatomic) DropDownView *dropDownView;
@property (nonatomic) NSArray *categories;
@property (nonatomic) NSArray *cellColors;
@property (nonatomic) BOOL isCategoryButtonTapped;
@property (nonatomic) UIButton *submitButton;
@property (nonatomic) NSMutableArray *categoryNameKaz;
@property (nonatomic) NSMutableArray *categoryNameRus;
@property (nonatomic) NSMutableArray *categoryName;
@property (nonatomic) NSOrderedSet *categorySet;
@property (nonatomic) NSString *currentCategory;
@property (nonatomic) HelperMethods *helperMethods;
@property (nonatomic) EmptyView *emptyView;

@property (nonatomic) Vacancy *vacancy;
@property (nonatomic) NSMutableArray *vacanciesArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MainViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MenuVC"];
    
    self.mmDrawerController = [[MMDrawerController alloc] initWithCenterViewController:self leftDrawerViewController:mainViewController];
    
    self.mmDrawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
    self.mmDrawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeTapCenterView & MMCloseDrawerGestureModeTapCenterView;
    
    window.rootViewController = self.mmDrawerController;
    [window makeKeyAndVisible];
    
    [self setup];

    [self queryDataFromParse];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.currentCategory = [NSString categoryAllKaz];
    } else {
        self.currentCategory = [NSString categoryAllRus];
    }
}

-(void)setup {
    
    self.vacanciesArray = [NSMutableArray new];
    self.helperMethods = [[HelperMethods alloc] init];
    
    self.screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.colors = @[[UIColor mondayColor],
                [UIColor tuesdayColor],
                [UIColor wednesdayColor],
                [UIColor thursdayColor],
                [UIColor fridayColor],
                [UIColor saturdayColor],
                [UIColor sundayColor]];
    
    self.categories = [NSMutableArray new];
    
    self.isCategoryButtonTapped = false;
    
    self.categoryNameKaz = [NSMutableArray new];
    self.categoryNameRus = [NSMutableArray new];
    
    self.mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height)];
    self.mainView.categoryNameLabel.text = self.currentCategory;
    [self.mainView.menuButton addTarget:self action:@selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.categoryButton addTarget:self action:@selector(categoryButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mainView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.screenBounds.height/8, self.screenBounds.width, self.screenBounds.height*7/8) style:UITableViewStylePlain];
    self.tableView.layer.cornerRadius = 5;
    self.tableView.rowHeight = self.tableView.frame.size.height/6;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    self.tableView.allowsSelectionDuringEditing = YES;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[JobTableViewCell class] forCellReuseIdentifier:@"JobCell"];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    self.emptyView = [[EmptyView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height*7/8)];
    [self.emptyView.picImageView setHidden:YES];
    [self.view addSubview:self.emptyView];
    
    self.blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height)];
    self.blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
    [self.blackView setHidden:true];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(categoryButtonPressed)];
    [self.blackView addGestureRecognizer:tap];
    [self.view addSubview:self.blackView];
    
    self.dropTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -self.screenBounds.height, self.screenBounds.width, self.screenBounds.height*7/8) style:UITableViewStylePlain];
    self.dropTableView.rowHeight = self.screenBounds.height*0.1;
    self.dropTableView.backgroundColor = [[UIColor violetColorOne] colorWithAlphaComponent:0.7f];
    self.dropTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.dropTableView setHidden:true];
    [self.view addSubview:self.dropTableView];
    
    [self.dropTableView registerClass:[CategoryTableViewCell class] forCellReuseIdentifier:@"CategoryCell"];
    [self.dropTableView setDelegate:self];
    [self.dropTableView setDataSource:self];
}

-(void)categoryButtonPressed {
    if(self.isCategoryButtonTapped) {
        [self.dropTableView setHidden:true];
        self.isCategoryButtonTapped = false;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.dropTableView.frame = CGRectMake(0, -self.screenBounds.height, self.screenBounds.width, self.screenBounds.height*7/8);
        } completion:nil];
    } else {
        [self.dropTableView setHidden:false];
        self.isCategoryButtonTapped = true;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.dropTableView.frame = CGRectMake(0, self.screenBounds.height/8, self.screenBounds.width, self.screenBounds.height*7/8);
        } completion:nil];
    }
}

-(void)menuButtonPressed {
    [self.mmDrawerController toggleDrawerSide:MMDrawerSideLeft animated:true completion:nil];
}

-(void)resetArrays {
    [self.categoryNameKaz removeAllObjects];
    [self.categoryNameRus removeAllObjects];
    [self.categoryNameKaz addObject:@"Барлығы"];
    [self.categoryNameRus addObject:@"Все"];
    [self.vacanciesArray removeAllObjects];
}

-(void)queryDataFromParse {
    [self resetArrays];
    [self.emptyView.activityIndicatorView startAnimating];
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"Vacancy"];
        if (![self.currentCategory isEqualToString:[NSString categoryAllKaz]] && ![self.currentCategory isEqualToString:[NSString categoryAllRus]] ) {
            if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
                [query whereKey:[NSString categoryNameKaz] equalTo:self.currentCategory];
            } else {
                [query whereKey:[NSString categoryNameRus] equalTo:self.currentCategory];
            }
        }
        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if (error == nil) {
                for (PFObject *object in objects) {
                    NSString *categoryNameKaz = object[[NSString categoryNameKaz]];
                    NSString *nameKaz = object[[NSString nameKaz]];
                    NSString *requirementsKaz = object[[NSString requirementsKaz]];
                    NSString *categoryNameRus = object[[NSString categoryNameRus]];
                    NSString *nameRus = object[[NSString nameRus]];
                    NSString *requirementsRus = object[[NSString requirementsRus]];
                    NSString *dateString = [self.helperMethods stringFromDate:[object createdAt]];
                    [self.categoryNameKaz addObject:categoryNameKaz];
                    [self.categoryNameRus addObject:categoryNameRus];
                    Vacancy *vacancy = [[Vacancy alloc] initWithName:nameKaz andNameRus:nameRus andCategoryNameKaz:categoryNameKaz andCategoryNameRus:categoryNameRus andRequirementsKaz:requirementsKaz andRequirementsRus:requirementsRus andDateString:dateString];
                    
                    [self.vacanciesArray addObject:vacancy];
                }
            } else {
                NSLog(@"%@", error);
                [self.emptyView.activityIndicatorView stopAnimating];
                [self.emptyView setHidden:NO];
            }
            if (self.vacanciesArray>0) {
                [self loadDataForLanguage];
                [self.dropTableView reloadData];
                [self.tableView reloadData];
                [self.emptyView setHidden:YES];
            } else {
                [self.emptyView setHidden:NO];
            }
            [self.emptyView.activityIndicatorView stopAnimating];
        }];
}

-(void)loadDataForLanguage {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.categoryName = self.categoryNameKaz;
        self.currentCategory = [NSString categoryAllKaz];
        self.mainView.jobsLabel.text = [[NSString vacancyKaz] uppercaseString];
    } else {
        self.categoryName = self.categoryNameRus;
        self.currentCategory = [NSString categoryAllRus];
        self.mainView.jobsLabel.text = [[NSString vacancyRus] uppercaseString];
    }
    self.categorySet = [NSOrderedSet orderedSetWithArray:self.categoryName];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if([tableView isEqual:self.tableView]) {
        return self.vacanciesArray.count;
    } else {
        return self.categorySet.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.tableView]) {
        JobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobCell" forIndexPath:indexPath];
        
        Vacancy *vacancy = self.vacanciesArray[indexPath.row];
        
        if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageRussian]]) {
            cell.jobTitleLabel.text = vacancy.nameRus;
            cell.jobDescriptionLabel.text = vacancy.requirementsRus;
            cell.jobDateLabel.text = vacancy.dateString;
            cell.jobLetterLabel.text = [vacancy.categoryNameRus substringToIndex:1];
        }else{
            cell.jobTitleLabel.text = vacancy.nameKaz;
            cell.jobDescriptionLabel.text = vacancy.requirementsKaz;
            cell.jobLetterLabel.text = [vacancy.categoryNameKaz substringToIndex:1];
            cell.jobDateLabel.text = vacancy.dateString;
        }
        cell.dateCircleView.backgroundColor = self.colors[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        cell.categoryLabel.text = [self.categorySet objectAtIndex:indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([tableView isEqual:self.dropTableView]) {
        self.currentCategory = [self.categorySet objectAtIndex:indexPath.row];
        self.mainView.categoryNameLabel.text = self.currentCategory;
        [self categoryButtonPressed];
        [self queryDataFromParse];
    } else {
        Vacancy *vacancy = self.vacanciesArray[indexPath.row];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        VacancyViewController *vacancyViewController = [storyboard instantiateViewControllerWithIdentifier:@"VacancyDetailVC"];
        if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
            vacancyViewController.categoryName = vacancy.categoryNameKaz;
            vacancyViewController.descriptionText = vacancy.requirementsKaz;
            vacancyViewController.dateText = vacancy.dateString;
            vacancyViewController.vacancyName = vacancy.nameKaz;
        } else {
            vacancyViewController.categoryName = vacancy.categoryNameRus;
            vacancyViewController.descriptionText = vacancy.requirementsRus;
            vacancyViewController.dateText = vacancy.dateString;
            vacancyViewController.vacancyName = vacancy.nameRus;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:vacancyViewController animated:true completion:nil];
        });
    }
}

@end
