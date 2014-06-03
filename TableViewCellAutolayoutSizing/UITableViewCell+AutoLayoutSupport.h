//
//  UITableViewCell+AutoLayoutSupport.h
//  TableViewCellAutoLayoutSizing
//
//  Created by Tom Abraham on 6/2/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (AutoLayoutSupport)

- (void)al_initAutoLayoutSupport;

- (CGFloat)al_heightForWidth:(CGFloat)width;

@end
