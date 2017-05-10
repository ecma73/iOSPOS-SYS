//
//  bulletin.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface bulletin : NSObject

@property (nonatomic, strong) NSString *bulletinNo;
@property (nonatomic, strong) NSString *bulletinType;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *end;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createUser;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *mdyUser;
@property (nonatomic, strong) NSString *mdyTime;

@end
