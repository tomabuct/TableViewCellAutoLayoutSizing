//
//  ViewController.m
//  TableViewCellAutolayoutSizing
//
//  Created by Tom Abraham on 5/28/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "ViewController.h"

#import "LabelTableViewCell.h"
#import "TableView.h"

NSString *const kCellID = @"Cell";

@interface ViewController ()

@property (nonatomic, strong) TableView *tableView;

@end

@implementation ViewController

- (instancetype)init {
  if (self = [super init]) {
    _tableView = [[TableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.userInteractionEnabled = YES;
    [_tableView registerClass:[LabelTableViewCell class] forCellReuseIdentifier:kCellID];
  }
  return self;
}

- (void)loadView {
  self.view = self.tableView;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(TableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  LabelTableViewCell *cell = (LabelTableViewCell *)[tableView sizingCellForReuseIdentifier:kCellID];
  [self _configureCell:cell atIndexPath:indexPath];
  return [cell al_heightForWidth:CGRectGetWidth(tableView.bounds)];
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  LabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
  [self _configureCell:cell atIndexPath:indexPath];
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

#pragma mark Content

- (void)_configureCell:(LabelTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  cell.label.text = [[self class] _lotsOfText:indexPath.row];
  cell.accessoryType = UITableViewCellAccessoryDetailButton;
}

+ (NSString *)_lotsOfText:(NSInteger)howMuch {
  NSString *const text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  return [NSString stringWithFormat:@"%d %@", howMuch, [[self class] _repeatString:text times:howMuch]];
}

+ (NSString *)_repeatString:(NSString *)string times:(NSUInteger)times {
  return [@"" stringByPaddingToLength:string.length * times withString:string startingAtIndex:0];
}

@end
