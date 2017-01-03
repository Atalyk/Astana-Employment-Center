//
//  EventTableViewCell.m
//  CZAstanaObjC
//
//  Created by Admin on 12/28/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "EventTableViewCell.h"
#import "UIFont+CustomFont.h"

@implementation EventTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    CGFloat frameWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.eventNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameWidth*0.05, frameBounds.height*0.15, frameWidth*0.9, frameBounds.height*0.7)];
    self.eventNameLabel.font = [UIFont resumeTextHelveticaLight];
    [self addSubview:self.eventNameLabel];
    
    self.dateStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameWidth*0.05, frameBounds.height*0.8, frameWidth*0.9, frameBounds.height*0.4)];
    self.dateStringLabel.font = [UIFont dateHelveticaLight];
    self.dateStringLabel.textColor = [UIColor grayColor];
    self.dateStringLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.dateStringLabel];
}

@end
