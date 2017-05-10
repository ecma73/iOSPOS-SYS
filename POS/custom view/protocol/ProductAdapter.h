//
//  ProductAdapter.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

#define createCellIdentifier @"createCellIdentifier"

@interface ProductAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSInteger test;
}
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *category;

@end
