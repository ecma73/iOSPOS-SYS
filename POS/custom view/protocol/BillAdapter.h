//
//  BillAdapter.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

#define billCellIdentifier @"billCellIdentifier"

@interface BillAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;

@end
