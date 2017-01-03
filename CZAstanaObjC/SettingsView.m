//
//  SettingsView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/24/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "SettingsView.h"
#import "UIColor+CustomColor.h"
#import "SettingsCollectionViewCell.h"
#import "NSString+CustomString.h"
#import "UIFont+CustomFont.h"
#import "NSString+CustomString.h"
#import "MainViewController.h"

@implementation SettingsView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    self.language = [NSString languageKazakh];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, frameBounds.height*0.1, frameBounds.width, frameBounds.height*0.6) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView setPagingEnabled:true];
    [self addSubview:self.collectionView];
    
    self.pageControl = [[UIPageControl alloc]
                    initWithFrame:CGRectMake(0, frameBounds.height*0.65, frameBounds.width, 50)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.pageIndicatorTintColor = [[UIColor violetColorOne] colorWithAlphaComponent:0.3f];
    self.pageControl.currentPageIndicatorTintColor = [UIColor violetColorTwo];
    self.pageControl.transform = CGAffineTransformMakeScale(2, 2);
    [self addSubview:self.pageControl];
    
    self.loginButton = [[UIButton alloc]
                    initWithFrame:CGRectMake(frameBounds.width*0.25, frameBounds.height*0.75, frameBounds.width*0.5, frameBounds.height*0.07)];
    self.loginButton.layer.cornerRadius = frameBounds.height*0.035;
    self.loginButton.backgroundColor = [UIColor violetColorOne];
    [self.loginButton setTitle:[NSString enterKaz] forState:UIControlStateNormal];
    [self.loginButton titleLabel].font = [UIFont resumeTextHelveticaLight];
    [self.loginButton addTarget:self action:@selector(presentingViewController) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginButton];
    
    self.languageButton = [[UIButton alloc] initWithFrame:CGRectMake(frameBounds.width*0.25,
                                                                 frameBounds.height*0.85,
                                                                 frameBounds.width*0.5,
                                                                 frameBounds.height*0.07)];
    [self.languageButton setTitle:[NSString languageRussian] forState:UIControlStateNormal];
    [self.languageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.languageButton titleLabel].font = [UIFont resumeTextHelveticaLight];
    [self addSubview:self.languageButton];
}

-(void)presentingViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewcontroller = [storyboard instantiateViewControllerWithIdentifier:[NSString vacancyViewController]];
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [[window rootViewController] presentViewController:mainViewcontroller animated:YES completion:nil];
}

@end
