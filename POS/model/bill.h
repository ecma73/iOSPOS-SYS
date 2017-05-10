//
//  bill.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface bill : NSObject

@property (nonatomic, strong) NSString *billNo;
@property (nonatomic, strong) NSString *billDate;
@property (nonatomic, strong) NSString *billTime;
@property (nonatomic, strong) NSString *reverseDate;
@property (nonatomic, strong) NSString *customerNo;
@property (nonatomic, strong) NSString *staffNo;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *invoiceNo;
@property (nonatomic, strong) NSString *cashier;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *createUser;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *mdyUser;
@property (nonatomic, strong) NSString *mdyTime;
@property (nonatomic, strong) NSNumber *syncStatus;

@end
