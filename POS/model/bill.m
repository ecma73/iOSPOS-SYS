//
//  bill.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "bill.h"

@implementation bill

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
