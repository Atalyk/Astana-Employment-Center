//
//  Event.m
//  CZAstanaObjC
//
//  Created by Admin on 12/28/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "Event.h"

@implementation Event

-(instancetype)initWithName:(NSString*)nameKaz andNameRus:(NSString*)nameRus andDescriptionKaz:(NSString*)descriptionKaz andDescriptionRus:(NSString*)descriptionRus andEventDate:(NSString*)dateString {
    self = [super init];
    
    if(self) {
        self.nameKaz = nameKaz;
        self.nameRus = nameRus;
        self.descriptionKaz = descriptionKaz;
        self.descriptionRus = descriptionRus;
        self.dateString = dateString;
    }
    return self;
}

@end
