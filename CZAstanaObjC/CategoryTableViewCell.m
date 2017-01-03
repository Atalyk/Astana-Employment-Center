//
//  CategoryTableViewCell.m
//  CZAstanaObjC
//
//  Created by Admin on 12/15/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    self.categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameBounds.width*0.05, 0, frameBounds.width*0.9, frameBounds.height)];
    self.categoryLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.categoryLabel];
}

@end
