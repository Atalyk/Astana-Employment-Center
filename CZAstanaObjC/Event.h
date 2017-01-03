//
//  Event.h
//  CZAstanaObjC
//
//  Created by Admin on 12/28/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic) NSString *nameKaz;
@property (nonatomic) NSString *nameRus;
@property (nonatomic) NSString *descriptionKaz;
@property (nonatomic) NSString *descriptionRus;
@property (nonatomic) NSString *dateString;

-(instancetype)initWithName:(NSString*)nameKaz andNameRus:(NSString*)nameRus andDescriptionKaz:(NSString*)descriptionKaz andDescriptionRus:(NSString*)descriptionRus andEventDate:(NSString*)dateString;

@end
