//
//  TableViewCell.m
//  TableViewCellAutolayoutSizing
//
//  Created by Tom Abraham on 5/28/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (CGFloat)heightForWidth:(CGFloat)width {
  // set cell width
  self.bounds = CGRectMake(0, 0, width, CGRectGetHeight(self.bounds));

  // lay out cell view hierarchy with specified width
  // this makes sure any preferredMaxLayoutWidths, etc. are set
  [self layoutIfNeeded];

  // +1 to account for 0.5pt cell separator http://tomabuct.com/post/73484699239/uitableviews-in-ios-7
  // since UITableView doesn't like it when tableView:heightForRowAtIndexPath: returns a fractional height
  return [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
}

@end
