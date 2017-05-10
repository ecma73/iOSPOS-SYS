//
//  billDetail.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface billDetail : NSObject

@property (nonatomic, strong) NSString *billNo;
@property (nonatomic, strong) NSString *itemNo;
@property (nonatomic, strong) NSString *productNo;
@property (nonatomic, strong) NSNumber *picec;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSString *staffNo;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createUser;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *mdyUser;
@property (nonatomic, strong) NSString *mdyTime;
@property (nonatomic, strong) NSNumber *syncStatus;

@end
