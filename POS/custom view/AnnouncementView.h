//
//  AnnouncementView.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "RootView.h"

@protocol AnnounceDelegate <NSObject>

@end
@interface AnnouncementView : RootView

@property (nonatomic, strong) id <AnnounceDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITableView *aTableView;

@end
