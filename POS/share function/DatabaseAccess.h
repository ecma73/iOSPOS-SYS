//
//  DatabaseAccess.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@class customer, bill;
@interface DatabaseAccess : NSObject

+ (DatabaseAccess*)databaseAccessInstance;

/*
 save category into local database from server
 */
- (void)saveCategoryData:(NSArray*)data;
- (NSArray*)GetCategories;

/*
 save products into local database from server
 */
- (void)saveProducts:(NSArray*)data;
- (NSArray*)GetProducts;

/*
 save staff data into local database from server
 */
- (void)saveStaff:(NSArray*)data;

/*
 save bulletin data from server
 */
- (void)saveBulletin:(NSArray*)data;

/*
 Get recently bulletins in local database
 */
- (NSArray*)GetRecentlyBulletins;

- (BOOL)saveBill:(bill*)b details:(NSArray*)data;

- (NSArray*)GetBills;

- (NSArray*)GetBillDestails:(NSString*)billNo;

- (void)saveCustomer:(customer*)c;

- (NSArray*)GetCustomerWithCustomerName:(NSString*)name;

- (BOOL)existInCustomerOfCustomer:(customer*)c;

@end
