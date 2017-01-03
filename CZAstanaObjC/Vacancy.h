//
//  Vacancy.h
//  CZAstanaObjC
//
//  Created by Admin on 12/27/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vacancy : NSObject

/*
 [_categoryNameKaz addObject:categoryNameKaz];
 [_nameKaz addObject:nameKaz];
 [_requirementsKaz addObject:requirementsKaz];
 [_categoryNameRus addObject:categoryNameRus];
 [_nameRus addObject:nameRus];
 [_requirementsRus addObject:requirementsRus];
 */

@property (nonatomic) NSString *nameKaz;
@property (nonatomic) NSString *nameRus;
@property (nonatomic) NSString *categoryNameKaz;
@property (nonatomic) NSString *categoryNameRus;
@property (nonatomic) NSString *requirementsKaz;
@property (nonatomic) NSString *requirementsRus;
@property (nonatomic) NSString *dateString;

-(instancetype)initWithName:(NSString *) nameKaz andNameRus:(NSString *)nameRus andCategoryNameKaz:(NSString*)categoryNameKaz andCategoryNameRus:(NSString*)categoryNameRus andRequirementsKaz:(NSString*)requirementsKaz andRequirementsRus:(NSString*)requirementsRus andDateString:(NSString*)dateString;

@end
