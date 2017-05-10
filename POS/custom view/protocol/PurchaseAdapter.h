//
//  PurchaseAdapter.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

#define purchaseItemCellIdeitnfier @"purchaseItemCellIdeitnfier"

@interface PurchaseAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSDictionary *details;

@end
