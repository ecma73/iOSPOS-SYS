//
//  LoginViewController.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, loginSection) {
    loginSectionField = 0,
    loginSectionButton = 1,
};

@interface LoginViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *aTableView;

@end
