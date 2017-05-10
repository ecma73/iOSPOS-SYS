//
//  PurchaseCell.h
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <UIKit/UIKit.h>

@interface PurchaseCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *productLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UILabel *pieceLabel;
@property (nonatomic, strong) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) IBOutlet UILabel *staffLabel;

@end
