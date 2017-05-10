//
//  BillCell.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <UIKit/UIKit.h>

@interface BillCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *billNoLabel;
@property (nonatomic, strong) IBOutlet UILabel *billDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *customerNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *staffNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) IBOutlet UILabel *statusLabel;

@end
