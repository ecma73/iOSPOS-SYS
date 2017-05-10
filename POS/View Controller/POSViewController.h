//
//  POSViewController.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <UIKit/UIKit.h>

@interface POSViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *titleView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;

- (void)showMenu;

- (IBAction)showMenuButtonPress:(id)sender;


@end
