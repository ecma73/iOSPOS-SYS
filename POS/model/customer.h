//
//  customer.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface customer : NSObject

@property (nonatomic, strong) NSString *customerNo;
@property (nonatomic, strong) NSString *customerName;
@property (nonatomic, strong) NSString *customerBirthday;
@property (nonatomic, strong) NSString *customerTel;
@property (nonatomic, strong) NSString *customerZip;
@property (nonatomic, strong) NSString *customerAddr;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *lastBillDate;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createUser;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *mdyUser;
@property (nonatomic, strong) NSString *mdyTime;
@property (nonatomic, strong) NSNumber *syncStatus;

@end
