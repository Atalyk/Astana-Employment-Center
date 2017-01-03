//
//  MenuViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/12/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "UIColor+CustomColor.h"
#import "UIImage+CustomImage.h"
#import "NSString+CustomString.h"
#import "MenuViewController.h"
#import "TopicCollectionViewCell.h"
#import "TestViewController.h"
#import "MainViewController.h"
#import "EventsViewController.h"
#import "ContactsViewController.h"
#import "ApplicantViewController.h"
#import "EmployeeViewController.h"
#import "AboutViewController.h"
#import "SettingsViewController.h"

@interface MenuViewController ()

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) CGSize screenBounds;
@property (nonatomic) NSArray *titlesKaz;
@property (nonatomic) NSArray *titlesRus;
@property (nonatomic) NSArray *viewControllers;
@property (nonatomic) NSArray *controllers;
@property (nonatomic) NSArray *images;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void) setup {
    
    self.view.backgroundColor = [UIColor facebookDarkGrayColor];
    
    self.titlesKaz = @[[NSString profTest], [NSString vacancyKaz], [NSString eventsKaz], [NSString contactsKaz], [NSString applicantKaz], [NSString employeeKaz], [NSString aboutKaz], [NSString settingsKaz]];
    
    self.titlesRus = @[[NSString profTest], [NSString vacancyRus], [NSString eventsRus], [NSString contactsRus], [NSString applicantRus], [NSString employeeRus], [NSString aboutRus], [NSString settingsRus]];
    
    self.viewControllers = @[@"TestVC", @"VacancyVC", @"EventsVC", @"ContactVC", @"ApplicantVC", @"EmployeeVC", @"ProjectVC", @"SettingsVC"];
    
    self.images = @[[UIImage testImage], [UIImage vacancyImage], [UIImage starImage], [UIImage contactImage], [UIImage applicantImage], [UIImage employeeImage], [UIImage aboutImage], [UIImage settingsImage]];
    
    self.screenBounds = [UIScreen mainScreen].bounds.size;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.screenBounds.height*0.05, self.screenBounds.width, self.screenBounds.height) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor facebookDarkGrayColor];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[TopicCollectionViewCell class] forCellWithReuseIdentifier:[NSString topicCell]];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString topicCell] forIndexPath:indexPath];
    if([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        cell.titleLabel.text = [self.titlesKaz objectAtIndex:indexPath.row];
    } else {
        cell.titleLabel.text = self.titlesRus[indexPath.row];
    }
    cell.picImageView.image = [self.images objectAtIndex:indexPath.row];
    return cell;
}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.screenBounds.width, self.screenBounds.height/10);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:self.viewControllers[indexPath.row]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:viewController animated:true completion:nil];
    });
}

@end
