//
//  EmptyView.m
//  CZAstanaObjC
//
//  Created by Admin on 12/29/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

#import "EmptyView.h"
#import "UIImage+CustomImage.h"

@implementation EmptyView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    CGSize frameBounds = [self frame].size;
    
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frameBounds.width*0.5-frameBounds.height*0.25, frameBounds.height*0.15, frameBounds.height*0.5, frameBounds.height*0.6)];
    self.picImageView.image = [UIImage emptyImage];
    [self addSubview:self.picImageView];
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicatorView.center = self.picImageView.center;
    [self addSubview:self.activityIndicatorView];
}

@end
