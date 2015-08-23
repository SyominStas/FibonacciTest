//
// Created by Stas Syomin on 23.08.15.
// Copyright (c) 2015 FLOTU. All rights reserved.
//

#import "FTFibonacciDataSource.h"

@implementation FTFibonacciDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [self init];
    self.array = [NSMutableArray array];
    self.tableView = tableView;
    [self.array addObject:@1];
    [self.array addObject:@1];
    [self increaseCapacity];
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.textLabel.text = [self getNumberAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Private methods

- (void)increaseCapacity {
    NSUInteger newCount = self.array.count;
    for (NSUInteger i = newCount; i < newCount + 20; i++) {
        NSNumber *prePrevious = self.array[i - 2];
        NSNumber *previous = self.array[i - 1];
        NSNumber *now = [[NSNumber alloc] initWithDouble:([prePrevious doubleValue] + [previous doubleValue])];
        [self.array addObject:now];
    }
}

- (NSString *)getNumberAtIndex:(NSUInteger)index {
    if (self.array.count - index < 20)
        [self increaseAndCallUpdate];
    return [self.array[index] description];
}

- (void)increaseAndCallUpdate {
    dispatch_async(dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0), ^{
        [self increaseCapacity];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

@end