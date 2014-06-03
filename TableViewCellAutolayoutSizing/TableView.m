//
//  TableView.m
//  TableViewCellAutoLayoutSizing
//
//  Created by Tom Abraham on 6/2/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "TableView.h"

@interface TableView ()

@property (strong, nonatomic) NSMutableDictionary *reuseIDToCellClassMap;
@property (strong, nonatomic) NSMutableDictionary *sizingCells;

@end

@implementation TableView

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier {
  [super registerClass:cellClass forCellReuseIdentifier:identifier];

  if (!self.reuseIDToCellClassMap) self.reuseIDToCellClassMap = [NSMutableDictionary new];

  // register reuseID -> cellClass mapping
  if (cellClass) {
    self.reuseIDToCellClassMap[identifier] = cellClass;

  // delete any existing reuseID -> cellClass mapping
  } else if (self.reuseIDToCellClassMap[identifier]) {
    [self.reuseIDToCellClassMap removeObjectForKey:identifier];
  }
}

- (UITableViewCell *)sizingCellForReuseIdentifier:(NSString *)identifier {
  NSAssert(identifier, @"identifier required");

  Class cellClass = (Class)self.reuseIDToCellClassMap[identifier];
  NSAssert(cellClass, @"unregistered identifier");

  if (!self.sizingCells) self.sizingCells = [NSMutableDictionary new];

  // make a sizing cell, if one doesn't already exist
  if (!self.sizingCells[identifier]) self.sizingCells[identifier] = [cellClass new];

  return self.sizingCells[identifier];
}

@end
