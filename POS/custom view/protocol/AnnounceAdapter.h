//
//  AnnounceAdapter.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

#define announceCellIdentifier @"announceCellIdentifier"
#define announceHeaderIdentifier @"announceHeaderIdentifier"

@class AnnounceItem;
@interface AnnounceAdapter : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;

@end
