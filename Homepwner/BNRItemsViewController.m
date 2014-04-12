//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Jan Grassegger on 12.04.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int worthItemCount = 0;
    
    NSArray *allItems = [[BNRItemStore sharedStore] allItems];
    
    for(BNRItem *item in allItems){
        if(item.valueInDollars > 50) worthItemCount++;
    }
    
    return (section == 0 ? worthItemCount : [allItems count] - worthItemCount) +1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    BNRItemStore *store  = [BNRItemStore sharedStore];
    NSArray *items = indexPath.section == 0 ? [store worthItems] : [store unworthItems];
    if (indexPath.row == items.count) {
       cell.textLabel.text = @"No more items!";
    } else {
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        [cell.textLabel setFont:[UIFont systemFontOfSize:20]];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableBackground"]];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"> 50$" : @"< 50$";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRItemStore *store  = [BNRItemStore sharedStore];
    NSArray *items = indexPath.section == 0 ? [store worthItems] : [store unworthItems];
    return indexPath.row == [items count] ? 44 : 60;
}

@end
