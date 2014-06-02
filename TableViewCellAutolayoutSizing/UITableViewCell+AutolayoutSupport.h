//
//  UITableViewCell+AutolayoutSupport.h
//  TableViewCellAutolayoutSizing
//
//  Created by Tom Abraham on 6/2/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (AutolayoutSupport)

- (void)al_initAutolayoutSupport;
- (CGFloat)al_heightForWidth:(CGFloat)width;

@end
