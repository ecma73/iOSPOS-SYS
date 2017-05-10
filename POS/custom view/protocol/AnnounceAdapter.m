//
//  AnnounceAdapter.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "AnnounceAdapter.h"
#import "AnnounceItem.h"

@implementation AnnounceAdapter

- (id)init
{
    self = [super init];
    if (self)
    {
        [self createdata];
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
    [titleLabel setText:@"公告事項"];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:announceCellIdentifier forIndexPath:indexPath];
    
    AnnounceItem *item = _items[row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%i. %@", row, item.comment]];
    
    return cell;
    
}

- (void)createdata
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0 ; i < 10 ; i++)
    {
        @autoreleasepool
        {
            AnnounceItem *item = [AnnounceItem new];
            item.Id = @12;
            item.title = [NSString stringWithFormat:@"我是標題"];
            item.comment = [NSString stringWithFormat:@"公告第%i條", i];
            [array addObject:item];
        }
        
    }
    self.items = [NSArray arrayWithArray:array];
}

@end
