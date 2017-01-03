//
//  DropDownView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/13/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "DropDownView.h"

@implementation DropDownView

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self setup];
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    self.categoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frameBounds.width, frameBounds.height)];
    [self addSubview:self.categoryTableView];
}

@end
