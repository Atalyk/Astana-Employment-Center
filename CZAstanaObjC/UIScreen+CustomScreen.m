//
//  UIScreen+CustomScreen.m
//  CZAstanaObjC
//
//  Created by Admin on 12/11/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "UIScreen+CustomScreen.h"

@implementation UIScreen (CustomScreen)

+(CGSize)screenSize {
    return [UIScreen mainScreen].bounds.size;
}

@end
