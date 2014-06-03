//
//  LabelTableViewCell.m
//  TableViewCellAutoLayoutSizing
//
//  Created by Tom Abraham on 5/28/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "LabelTableViewCell.h"

@implementation LabelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    _label = [[UILabel alloc] init];
    _label.numberOfLines = 0;
    [self.contentView addSubview:_label];

    [self _installConstraints];
  }
  return self;
}

#pragma mark Layout

- (void)_installConstraints {
  [self al_initAutoLayoutSupport];

  NSDictionary *views = @{ @"label": self.label, @"contentView": self.contentView };

  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentView(>=50)]" options:0 metrics:nil views:views]];

  self.label.translatesAutoresizingMaskIntoConstraints = NO;
  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:nil views:views]];
  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:nil views:views]];
}

- (void)layoutSubviews {
  [super layoutSubviews];

  // since we need to use self.label's width below, we force self.contentView to layout immediately
  [self.contentView setNeedsLayout];
  [self.contentView layoutIfNeeded];

  // http://www.objc.io/issue-3/advanced-auto-layout-toolbox.html#intrinsic_content_size_of_multiline_text
  self.label.preferredMaxLayoutWidth = CGRectGetWidth(self.label.bounds);

  [super layoutSubviews];
}

@end
