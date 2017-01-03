//
//  UIFont+CustomFont.m
//  CZAstanaObjC
//
//  Created by Admin on 12/11/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "UIFont+CustomFont.h"
#import "UIScreen+CustomScreen.h"

@implementation UIFont (CustomFont)

+(UIFont*)helveticaLightSmall {
    return [UIFont fontWithName:@"Helvetica-Light" size:[UIScreen screenSize].width*0.042];
}

+(UIFont*)helveticaLightBig {
    return [UIFont fontWithName:@"Helvetica-Light" size:[UIScreen screenSize].width*0.07];
}

+(UIFont*)helveticaNeue {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:[UIScreen screenSize].width*0.04];
}

+(UIFont*)helveticaNeueBig {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:[UIScreen screenSize].width*0.05];
}

+(UIFont*)resumeTextHelveticaLight {
    return [UIFont fontWithName:@"Helvetica-Light" size:[UIScreen screenSize].width*0.045];
}

+(UIFont*)vacancyTitleLabelHelveticaLight {
    return [UIFont fontWithName:@"Helvetica-Light" size:[UIScreen screenSize].width*0.07];
}

+(UIFont*)dateHelveticaLight {
    return [UIFont fontWithName:@"Helvetica-Light" size:[UIScreen screenSize].width*0.035];
}
+(UIFont*)helveticaLight0p55 {
    return [UIFont fontWithName:@"Helvetica-Light" size:[UIScreen screenSize].width*0.055];
}

+(UIFont*)avenirRegular {
    return [UIFont fontWithName:@"Helvetica" size:[UIScreen screenSize].width*0.045];
}

@end
