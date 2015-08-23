//
// Created by Stas Syomin on 23.08.15.
// Copyright (c) 2015 FLOTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FTFibonacciDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSMutableArray *array;
@property (nonatomic) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end