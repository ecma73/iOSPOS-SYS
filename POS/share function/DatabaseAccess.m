//
//  DatabaseAccess.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "DatabaseAccess.h"
#import "DatabaseConnection.h"
#import "DateFunction.h"
#import "bulletin.h"
#import "category.h"
#import "product.h"
#import "bill.h"
#import "billDetail.h"
#import "staff.h"
#import "customer.h"

@implementation DatabaseAccess

+ (DatabaseAccess*)databaseAccessInstance
{
    static id databaseAccessInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        databaseAccessInstance = [DatabaseAccess new];
    });
    
    return databaseAccessInstance;
}

#pragma mark - Category

- (void)saveCategoryData:(NSArray*)data
{
    BOOL saveInd = YES;
    for (category *item in data) {
        NSString *str = [NSString stringWithFormat:@"insert into category values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '0')",item.categoryType, item.categoryNo, item.categoryNo, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.categoryNo);
        }
    }
}

- (NSArray*)GetCategories
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from category order by category_no"];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            category *item = [category new];
            item.categoryType = [rs stringForColumn:@"category_type"];
            item.categoryNo = [rs stringForColumn:@"category_no"];
            item.categoryName = [rs stringForColumn:@"category_name"];
            item.status = [rs stringForColumn:@"status"];
            item.createTime = [rs stringForColumn:@"create_user"];
            item.createUser = [rs stringForColumn:@"create_time"];
            item.mdyUser = [rs stringForColumn:@"mdy_user"];
            item.mdyTime = [rs stringForColumn:@"mdy_time"];
            [array addObject:item];
        }
    }
    return array;
}

#pragma mark - Product
- (void)saveProducts:(NSArray*)data
{
    BOOL saveInd = YES;
    for (product *item in data) {
        NSString *str = [NSString stringWithFormat:@"insert into product values ('%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', %@, %@, '%@', '%@', '%@', '%@', '%@', '%@', '0')", item.productNo, item.productId, item.productName, item.productType, item.productLabel, item.productPrice, item.priceQual, item.productUnit, item.quantityLimit, item.sort, item.remarks, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.productNo);
        }
    }
}

- (NSArray*)GetProducts
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from product"];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            product *item = [product new];
            item.productNo = [rs stringForColumn:@"product_no"];
            item.productId = [rs stringForColumn:@"prpoduct_id"];
            item.productType = [rs stringForColumn:@"product_type"];
            item.productName = [rs stringForColumn:@"product_name"];
            item.productLabel = [rs stringForColumn:@"product_label"];
            item.productPrice = [NSNumber numberWithInteger:[rs intForColumn:@"product_price"]];
            item.priceQual = [rs stringForColumn:@"product_qual"];
            item.productUnit = [rs stringForColumn:@"product_unit"];
            item.quantityLimit = [NSNumber numberWithInteger:[rs intForColumn:@"quantity_limit"]];
            item.sort = [NSNumber numberWithInteger:[rs intForColumn:@"sort"]];
            item.remarks = [rs stringForColumn:@"remarks"];
            [array addObject:item];
        }
    }
    return array;
}

#pragma mark - Staff

- (void)saveStaff:(NSArray*)data
{
    BOOL saveInd = YES;
    for (staff *item in data)
    {
        NSString *str = [NSString stringWithFormat:@"insert into staff values ('%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', %@, %@, '%@', '%@', '%@', '%@', '%@', '%@', '0')", item.staffNo, item.staffRold, item.staffId, item.staffPwd, item.staffName, item.staffTel1, item.staffTel2, item.staffZip, item.staffAddr, item.arriveDate, item.leaveDate, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.staffName);
        }
    }
}

#pragma mark - Bulletin

- (void)saveBulletin:(NSArray*)data
{
    BOOL saveInd = YES;
    [[DatabaseConnection GetPosDB] beginTransaction];
    for (bulletin *item in data)
    {
        NSString *str = [NSString stringWithFormat:@"insert into bulletin values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@','%@', '%@', '0')",item.bulletinNo, item.bulletinType, item.start, item.end, item.content, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.bulletinNo);
            [[DatabaseConnection GetPosDB] rollback];
            return;
        }
    }
    [[DatabaseConnection GetPosDB] commit];
}

- (NSArray*)GetRecentlyBulletins
{
    NSString *today = [[DateFunction dateFunctionInstance] DateToString:[NSDate date]];
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from bulletin where %@ between start and end order by start desc", today];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            bulletin *item = [bulletin new];
            item.bulletinNo = [rs stringForColumn:@"bulletin_no"];
            item.bulletinType = [rs stringForColumn:@"type"];
            item.start = [rs stringForColumn:@"start"];
            item.end = [rs stringForColumn:@"end"];
            item.content = [rs stringForColumn:@"content"];
            item.status = [rs stringForColumn:@"status"];
            item.createUser = [rs stringForColumn:@"create_user"];
            item.createTime = [rs stringForColumn:@"create_time"];
            item.mdyUser = [rs stringForColumn:@"mdy_user"];
            item.mdyTime = [rs stringForColumn:@"mdy_time"];
            [array addObject:item];
        }
    }
    
    return array;
}

#pragma mark - Invoice ,Billings Detail
- (BOOL)existBillNoInBill:(NSString*)billNo
{
    int counter = 0;
    NSString *str = [NSString stringWithFormat:@"select count(*) from bill where bill_no = '%@'", billNo];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    if ([rs next])
    {
        counter = [rs intForColumnIndex:0];
    }
    
    if (counter > 0)
        return YES;
    return NO;
}

- (BOOL)saveBill:(bill*)b details:(NSArray*)data
{
    BOOL saveInd = YES;
    NSString *str = [NSString stringWithFormat:@"insert into staff values ('%@', '%@', '%@', '%@', '%@', '%@', %@, '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", b.billNo, b.billDate, b.billTime, b.reverseDate, b.customerNo, b.staffNo, b.amount, b.remarks, b.invoiceNo, b.cashier, b.staffNo, b.createUser, b.createTime, b.mdyUser, b.mdyTime, b.syncStatus];
    
    [[DatabaseConnection GetPosDB] beginTransaction];
    
    saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
    
    if (saveInd)
    {
        NSLog(@"%@ -> save error", b.billNo);
        [[DatabaseConnection GetPosDB] rollback];
        return NO;
    }
    
    //save all transaction details
    for (billDetail *item in data)
    {
        str = [NSString stringWithFormat:@"insert into bulletin values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@','%@', '%@', '%@', '%@', '%@', '%@')", item.billNo, item.itemNo, item.productNo, item.picec, item.price, item.amount, item.staffNo, item.remarks, item.status, item.createUser, item.createTime, item.mdyUser, item.mdyTime, item.syncStatus];
        saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
        if (saveInd)
        {
            NSLog(@"%@ -> save error", item.productNo);
        }
    }
    
    [[DatabaseConnection GetPosDB] commit];
    
    return saveInd;
}

- (NSArray*)GetBills
{
    NSMutableArray *array = [NSMutableArray array];
    
    return array;
}

- (NSArray*)GetBillDestails:(NSString*)billNo
{
    NSMutableArray *array = [NSMutableArray array];
    
    return array;
}

#pragma mark - customer

- (BOOL)existInCustomerOfCustomer:(customer*)c
{
    int counter = 0;
    NSString *str = [NSString stringWithFormat:@"select count(*) from customer where and customer_no = '%@'", c.customerNo];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    if ([rs next])
    {
        counter = [rs intForColumnIndex:0];
    }
    if (counter > 0)
        return YES;
    return NO;
}

- (NSArray*)GetCustomerWithCustomerName:(NSString*)name
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"select * from customer where customer_name = '%@'", name];
    FMResultSet *rs = [[DatabaseConnection GetPosDB] executeQuery:str];
    while ([rs next])
    {
        @autoreleasepool {
            customer *item = [customer new];
            item.customerNo = [rs stringForColumn:@"customer_no"];
            item.customerName = [rs stringForColumn:@"customer_name"];
            item.customerBirthday = [rs stringForColumn:@"customer_birthday"];
            item.customerTel = [rs stringForColumn:@"customer_tel"];
            item.customerZip = [rs stringForColumn:@"customer_zip"];
            item.customerAddr = [rs stringForColumn:@"customer_addr"];
            item.remarks = [rs stringForColumn:@"remarks"];
            item.lastBillDate = [rs stringForColumn:@"last_bill_date"];
            item.status = [rs stringForColumn:@"status"];
            item.createUser = [rs stringForColumn:@"create_date"];
            item.createTime = [rs stringForColumn:@"create_time"];
            item.mdyUser = [rs stringForColumn:@"mdy_user"];
            item.mdyTime = [rs stringForColumn:@"mdy_time"];
            item.syncStatus = [NSNumber numberWithInteger:[rs intForColumn:@"sync_status"]];
            [array addObject:item];
        }
    }
    return array;
}

- (void)saveCustomer:(customer*)c
{
    BOOL saveInd = NO;
    NSString *str = [NSString stringWithFormat:@"insert into bulletin values ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@','%@', '%@', '%@', '%@', '%@', '%@')",c.customerNo, c.customerNo, c.customerBirthday, c.customerTel, c.customerZip, c.customerAddr, c.remarks, c.lastBillDate, c.status, c.createUser, c.createTime, c.mdyUser, c.mdyUser, c.syncStatus];
    saveInd = [[DatabaseConnection GetPosDB] executeUpdate:str];
    if (saveInd)
    {
        NSLog(@"%@ -> save error", c.customerName);
    }
}

@end
