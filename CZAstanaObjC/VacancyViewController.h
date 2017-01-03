//
//  VacancyViewController.h
//  CZAstanaObjC
//
//  Created by Admin on 12/27/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VacancyView.h"

@interface VacancyViewController : UIViewController

@property (nonatomic) VacancyView *vacancyView;
@property (nonatomic) NSString *dateText;
@property (nonatomic) NSString *descriptionText;
@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSString *vacancyName;

@end
