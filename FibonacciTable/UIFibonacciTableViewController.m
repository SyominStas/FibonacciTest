//
//  ViewController.m
//  FibonacciTable
//
//  Created by Stas Syomin on 23.08.15.
//  Copyright (c) 2015 FLOTU. All rights reserved.
//

#import "UIFibonacciTableViewController.h"
#import "FTFibonacciDataSource.h"

@interface UIFibonacciTableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) FTFibonacciDataSource *delegate;

@end

@implementation UIFibonacciTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = [[FTFibonacciDataSource alloc] initWithTableView:self.tableView];
    [self.tableView setDataSource:self.delegate];
    [self.tableView setDelegate:self.delegate];
}

@end
