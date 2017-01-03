//
//  SettingsViewController.h
//  CZAstanaObjC
//
//  Created by Admin on 12/24/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

+(NSString *)getCurrentLanguage;

@end
