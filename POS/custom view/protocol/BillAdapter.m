//
//  BillAdapter.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "BillAdapter.h"
#import "BillCell.h"
#import "bill.h"
#import "MathFunction.h"

@implementation BillAdapter

- (id)init
{
    self = [super init];
    if (self)
    {
        [self createData];
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 22;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 22)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, tableView.frame.size.width, 20)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor darkGrayColor]];
    [titleLabel setText:@"清單"];
    [headerView addSubview:titleLabel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    BillCell *cell = [tableView dequeueReusableCellWithIdentifier:billCellIdentifier forIndexPath:indexPath];
    
    bill *item = _items[row];
    
    [cell.billNoLabel setText:item.billNo];
    [cell.billDateLabel setText:item.billDate];
    [cell.customerNameLabel setText:item.customerNo];
    [cell.staffNameLabel setText:item.staffNo];
    [cell.amountLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:item.amount]];
    [cell.statusLabel setText:item.status];
    
    return cell;
    
}

- (void)createData
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0 ; i < 10; i++)
    {
        @autoreleasepool {
            bill *item = [bill new];
            
            item.billNo = @"20140300%02i";
            item.billDate = @"2014/03/01";
            item.amount = [NSNumber numberWithInteger:99999];
            item.customerNo = @"張星星";
            item.staffNo = @"李姎凌";
            item.status = @"0";
            
            [array addObject:item];
        }
    }
    self.items = [NSArray arrayWithArray:array];
}

@end
