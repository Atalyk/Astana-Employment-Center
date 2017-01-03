//
//  HelperMethods.m
//  CZAstanaObjC
//
//  Created by Admin on 12/27/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "SettingsViewController.h"
#import "NSString+CustomString.h"
#import "HelperMethods.h"

@implementation HelperMethods

-(NSString *)stringFromDate:(NSDate *)createdAt{
    
    NSArray *monthsKZ = [[NSArray alloc] initWithObjects:@"Қаңтар", @"Ақпан", @"Наурыз", @"Сәуір", @"Мамыр", @"Маусым", @"Шілде", @"Тамыз", @"Қыркүйек", @"Қазан", @"Қараша", @"Желтоқсан", nil];
    NSArray *monthsRus = [[NSArray alloc] initWithObjects:@"Январь", @"Февраль", @"Март", @"Апрель", @"Май", @"Июнь", @"Июль", @"Август", @"Сентябрь", @"Октябрь", @"Ноябрь", @"Декабрь", nil];
    
    NSDate* currentDate = [NSDate date];
    NSTimeZone* currentTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* nowTimeZone = [NSTimeZone systemTimeZone];
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:currentDate];
    NSInteger nowGMTOffset = [nowTimeZone secondsFromGMTForDate:currentDate];
    NSTimeInterval interval = nowGMTOffset - currentGMTOffset;
    NSDate* nowDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:currentDate];
    
    NSTimeInterval distanceBetweenDates = [nowDate timeIntervalSinceDate:createdAt];
    double secondsInMinute = 60;
    NSInteger minutesBetweenDates = (distanceBetweenDates - 360*60)/secondsInMinute;
    
    NSString *dateString = [NSString new];
    int hours = (int)minutesBetweenDates/60;
    //int days = (int)minutesBetweenDates/(60*24);
    NSLog(@"hours %i", hours);
    if (minutesBetweenDates < 60) {
        dateString = [NSString stringWithFormat:@"%lo минут бұрын", minutesBetweenDates];
    }
    else if( hours < 24 ){
        NSLog(@" \n\n\n %i сағат бұрын", hours);
        dateString = [NSString stringWithFormat:@"%i сағат бұрын", hours];
    }else{
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"d"];
        NSString* dayString = [dateFormat stringFromDate:createdAt];
        [dateFormat setDateFormat:@"M"];
        NSString* monthString = [dateFormat stringFromDate:createdAt];
        //[dateFormat setDateFormat:@"YYYY"];
        //NSString* yearString = [dateFormat stringFromDate:createdAt];
        
        if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageRussian]]) {
            dateString = [NSString stringWithFormat:@"%@ %@", dayString, monthsRus[[monthString intValue]-1]];
        }else{
            dateString = [NSString stringWithFormat:@"%@ %@", dayString, monthsKZ[[monthString intValue]-1]];
        }
    }
    
    return dateString;
}

@end
