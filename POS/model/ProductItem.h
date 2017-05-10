//
//  ProductItem.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface ProductItem : NSObject

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *stock;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *imageUrl;

@end
