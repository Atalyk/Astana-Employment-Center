//
//  SettingsViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/24/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsCollectionViewCell.h"
#import "UIImage+CustomImage.h"
#import "SettingsView.h"
#import "NSString+CustomString.h"

@interface SettingsViewController ()

@property (nonatomic) CGSize screenBounds;
@property (nonatomic) SettingsView *settingsView;
@property (nonatomic) NSArray *cellImages;
@property (nonatomic) NSArray *detailTextsKaz;
@property (nonatomic) NSArray *detailTextsRus;
@property (nonatomic) NSArray *detailTexts;

@end

@implementation SettingsViewController

static NSString *language;

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
    
    self.cellImages = @[[UIImage welcomeImageOne], [UIImage welcomeImageTwo], [UIImage welcomeImageThree]];
    self.detailTextsKaz = @[@"Бос жұмыс орындарын іздеу", @"Кәсіби бағдарлауға қатысты тест", @"Пайдалы ақпарат"];
    self.detailTextsRus = @[@"Поиск доступных вакансий", @"Тест на профессиональную ориентацию", @"Полезная информация"];
    
    self.settingsView = [[SettingsView alloc] initWithFrame:CGRectMake(0, 0, self.screenBounds.width, self.screenBounds.height)];
    [self.settingsView.languageButton addTarget:self action:@selector(changeLanguage) forControlEvents:UIControlEventTouchUpInside];
    language = self.settingsView.language;
    [self.settingsView.collectionView setDelegate:self];
    [self.settingsView.collectionView setDataSource:self];
    [self.settingsView.collectionView registerClass:[SettingsCollectionViewCell class] forCellWithReuseIdentifier:[NSString settingCell]];
    [self.view addSubview:self.settingsView];
}

-(void)loadDataForLanguage {
    if ([language isEqualToString:[NSString languageKazakh]]) {
        self.detailTexts = self.detailTextsKaz;
    } else {
        self.detailTexts = self.detailTextsRus;
    }
    [self.settingsView.collectionView reloadData];
}

-(void)changeLanguage {
    if ([language  isEqual: [NSString languageRussian]]) {
        language = [NSString languageKazakh];
        [self.settingsView.loginButton setTitle:[NSString enterKaz] forState:UIControlStateNormal];
        [self.settingsView.languageButton setTitle:[NSString languageRussian] forState:UIControlStateNormal];
    } else {
        language = [NSString languageRussian];
        [self.settingsView.loginButton setTitle:[NSString enterRus] forState:UIControlStateNormal];
        [self.settingsView.languageButton setTitle:[NSString languageKazakh] forState:UIControlStateNormal];
    }
    [self loadDataForLanguage];
}

#pragma mark - Helper methods
+(NSString *)getCurrentLanguage{
    return language;
}

#pragma mark - CollectionView delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SettingsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString settingCell] forIndexPath:indexPath];
    cell.picImageView.image = [self.cellImages objectAtIndex:indexPath.row];
    cell.detailLabel.text = [self.detailTexts objectAtIndex:indexPath.row];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = self.settingsView.collectionView.contentOffset.x / self.settingsView.collectionView.frame.size.width;
    self.settingsView.pageControl.currentPage = currentIndex;
}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.screenBounds.width, self.screenBounds.height*0.6);
}

@end
