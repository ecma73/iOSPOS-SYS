//
//  customer.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "customer.h"

@implementation customer

- (id)init
{
    self = [super init];
    if (self)
    {
        self.syncStatus = [NSNumber numberWithInteger:syncStatusNeed];
    }
    return self;
}

@end
