//
//  Vacancy.m
//  CZAstanaObjC
//
//  Created by Admin on 12/27/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "Vacancy.h"

@implementation Vacancy

-(instancetype)initWithName:(NSString *)nameKaz andNameRus:(NSString *)nameRus andCategoryNameKaz:(NSString *)categoryNameKaz andCategoryNameRus:(NSString *)categoryNameRus andRequirementsKaz:(NSString *)requirementsKaz andRequirementsRus:(NSString *)requirementsRus andDateString:(NSString *)dateString{
    self = [super init];
    
    if (self) {
        self.nameKaz = nameKaz;
        self.nameRus = nameRus;
        self.categoryNameKaz = categoryNameKaz;
        self.categoryNameRus = categoryNameRus;
        self.requirementsKaz = requirementsKaz;
        self.requirementsRus = requirementsRus;
        self.dateString = dateString;
    }
    
    return self;
}

@end
