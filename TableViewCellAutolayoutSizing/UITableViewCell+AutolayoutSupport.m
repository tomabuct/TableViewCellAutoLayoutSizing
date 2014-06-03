//
//  UITableViewCell+AutolayoutSupport.m
//  TableViewCellAutolayoutSizing
//
//  Created by Tom Abraham on 6/2/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "UITableViewCell+AutolayoutSupport.h"

@implementation UITableViewCell (AutolayoutSupport)

- (void)al_initAutolayoutSupport {
  // this prevents the temporary unsatisfiable constraint state that the cell's contentView could
  // enter since it starts off 44pts tall (atleast on OS6 and OS7)
  self.contentView.autoresizingMask |= UIViewAutoresizingFlexibleHeight;
}

- (CGFloat)al_heightForWidth:(CGFloat)width {
  // set cell width
  self.bounds = CGRectMake(0, 0, width, CGRectGetHeight(self.bounds));

  // lay out cell view hierarchy with specified width
  // this makes sure any preferredMaxLayoutWidths, etc. are set
  [self layoutIfNeeded];

  // to account for the OS7 cell separator http://tomabuct.com/post/73484699239/uitableviews-in-ios-7
  // TODO (tomabuct): add OS6 support
  // ceil since UITableView doesn't like fractional values from tableView:heightForRowAtIndexPath:
  const CGFloat kCellSeparatorViewHeight = 1 / self.contentScaleFactor;
  return ceil([self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + kCellSeparatorViewHeight);
}

@end
