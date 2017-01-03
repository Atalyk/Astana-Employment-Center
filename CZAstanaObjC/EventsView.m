//
//  EventsView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/28/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "EventTableViewCell.h"
#import "NSString+CustomString.h"
#import "UIImage+CustomImage.h"
#import "UIColor+CustomColor.h"
#import "UIFont+CustomFont.h"
#import "EventsView.h"

@implementation EventsView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameBounds.width, frameBounds.height)];
    self.view.backgroundColor = [UIColor backgroundGrayColor];
    [self addSubview:self.view];
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameBounds.width, frameBounds.height/8)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setFrame:self.headerView.frame];
    gradientLayer.colors = @[(id)[UIColor violetColorOne].CGColor, (id)[UIColor violetColorOne].CGColor];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    [self.headerView.layer insertSublayer:gradientLayer atIndex:0];
    [self addSubview:self.headerView];
    
    self.closeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameBounds.height*0.05, frameBounds.height*0.058, frameBounds.height*0.02, frameBounds.height*0.02)];
    [self.closeImageView setContentMode:UIViewContentModeScaleToFill];
    self.closeImageView.image = [UIImage closeImage];
    [self addSubview:self.closeImageView];
    
    self.eventsLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameBounds.width*0.23, frameBounds.height*0.016, frameBounds.width*0.57, frameBounds.height*0.1)];
    self.eventsLabel.font = [UIFont helveticaNeueBig];
    self.eventsLabel.textColor = [UIColor whiteColor];
    self.eventsLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.eventsLabel];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(frameBounds.width*0.04, frameBounds.height*0.05, frameBounds.width*0.1, frameBounds.width*0.1)];
    [self.closeButton addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, frameBounds.height/8, frameBounds.width, frameBounds.height*7/8) style:UITableViewStylePlain];
    self.tableView.rowHeight = self.tableView.bounds.size.height/8;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[EventTableViewCell class] forCellReuseIdentifier:[NSString eventCell]];
    [self addSubview:self.tableView];
}

-(void)closeButtonPressed {
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window.rootViewController dismissViewControllerAnimated:true completion:nil];
}

@end
