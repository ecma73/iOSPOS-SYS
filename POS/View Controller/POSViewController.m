//
//  POSViewController.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "POSViewController.h"
#import "MenuTableViewController.h"

#import "AnnouncementView.h"
#import "AnnounceAdapter.h"
#import "CreateView.h"
#import "ProductAdapter.h"
#import "PurchaseAdapter.h"
#import "BillAdapter.h"
#import "productCell.h"
#import "PurchaseCell.h"

@interface POSViewController () <MenuOptionDelegate, AnnounceDelegate, CreateViewDelegate>

@property (readwrite, nonatomic) MenuTableViewController *menuViewController;
@property (nonatomic, strong) AnnouncementView *announceView;
@property (nonatomic, strong) AnnounceAdapter *dataAdapter;
@property (nonatomic, strong) CreateView *createView;
@property (nonatomic, strong) CreateView *modifyView;
@property (nonatomic, strong) CreateView *queryView;
@property (nonatomic, strong) CreateView *commitView;
@property (nonatomic, strong) ProductAdapter *productAdapter;
@property (nonatomic, strong) PurchaseAdapter *purchaseAdapter;
@property (nonatomic, strong) BillAdapter *billAdapter;
@property (nonatomic, strong) BillAdapter *queryAdapter;
@property (nonatomic, strong) BillAdapter *commitAdapter;

@property (weak) RootView *baseView;

- (void)createAllViews;

@end

@implementation POSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createAllViews];
    self.menuViewController = [[MenuTableViewController alloc] init];
    self.menuViewController.delegate = self;
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    /*
     release
     */
    //add a shadow
    CALayer *layer = _titleView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_announceView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenu
{
    [self.menuViewController presentFromViewController:self animated:YES completion:nil];
}

- (IBAction)showMenuButtonPress:(id)sender
{
    [self showMenu];
}

- (void)createAllViews
{
    CGRect frame = CGRectMake(0, 81, 1024, 768 - 80);
    /*
     公告頁面
     */
    self.announceView = [[[NSBundle mainBundle] loadNibNamed:@"AnnouncementView" owner:self options:nil] objectAtIndex:0];
    self.announceView.frame = frame;
    self.announceView.delegate = self;
    [_announceView.aTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:announceCellIdentifier];
    [_announceView.aTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:announceHeaderIdentifier];
    self.dataAdapter = [[AnnounceAdapter alloc] init];
    _announceView.aTableView.dataSource = _dataAdapter;
    _announceView.aTableView.delegate = _dataAdapter;
    
    [self.view addSubview:_announceView];
    /*
     開單頁面
     */
    self.createView = [[[NSBundle mainBundle] loadNibNamed:@"CreateView" owner:self options:nil] objectAtIndex:0];
    self.createView.alpha = 0;
    self.createView.frame = frame;
    self.createView.type = MenuTypeCreate;
    self.createView.delegate = self;
    [self.createView.aCollectionView registerNib:[UINib nibWithNibName:@"productCell" bundle:nil] forCellWithReuseIdentifier:createCellIdentifier];
    [self.createView.aTableView registerNib:[UINib nibWithNibName:@"PurchaseCell" bundle:nil] forCellReuseIdentifier:purchaseItemCellIdeitnfier];
    self.productAdapter = [[ProductAdapter alloc] init];
    self.purchaseAdapter = [[PurchaseAdapter alloc] init];
    self.createView.aCollectionView.delegate = _productAdapter;
    self.createView.aCollectionView.dataSource = _productAdapter;
    self.createView.aTableView.delegate = _purchaseAdapter;
    self.createView.aTableView.dataSource = _purchaseAdapter;
    self.createView.aCollectionView.backgroundColor = [UIColor clearColor];
    /*
     ConfigurationDelegate
     */
    self.createView.nameField.delegate = _createView;
    self.createView.telField.delegate = _createView;
    self.createView.unitField.delegate = _createView;
    [self.view addSubview:_createView];
    
    /*
     Modify the screen
     */
    self.modifyView = [[[NSBundle mainBundle] loadNibNamed:@"CreateView" owner:self options:nil] objectAtIndex:0];
    self.modifyView.alpha = 0;
    self.modifyView.frame = frame;
    self.modifyView.type = MenuTypeModify;
    self.modifyView.delegate = self;
    [self.modifyView.aCollectionView registerNib:[UINib nibWithNibName:@"productCell" bundle:nil] forCellWithReuseIdentifier:createCellIdentifier];
    [self.modifyView.aTableView registerNib:[UINib nibWithNibName:@"BillCell" bundle:nil] forCellReuseIdentifier:billCellIdentifier];
    self.billAdapter = [[BillAdapter alloc] init];
    self.modifyView.aCollectionView.delegate = _productAdapter;
    self.modifyView.aCollectionView.dataSource = _productAdapter;
    self.modifyView.aTableView.delegate = _billAdapter;
    self.modifyView.aTableView.dataSource = _billAdapter;
    self.modifyView.aCollectionView.backgroundColor = [UIColor clearColor];
    /*
     ConfigurationDelegate
     */
    self.modifyView.nameField.delegate = _modifyView;
    self.modifyView.telField.delegate = _modifyView;
    self.modifyView.unitField.delegate = _modifyView;
    [self.view addSubview:_modifyView];
    /*
     Screen query
     */
    /*
     modify the screen
     */
    self.queryView = [[[NSBundle mainBundle] loadNibNamed:@"CreateView" owner:self options:nil] objectAtIndex:0];
    self.queryView.alpha = 0;
    self.queryView.frame = frame;
    self.queryView.type = MenuTypeQuery;
    self.queryView.delegate = self;
    [self.queryView.aCollectionView registerNib:[UINib nibWithNibName:@"productCell" bundle:nil] forCellWithReuseIdentifier:createCellIdentifier];
    [self.queryView.aTableView registerNib:[UINib nibWithNibName:@"BillCell" bundle:nil] forCellReuseIdentifier:billCellIdentifier];
    self.queryAdapter = [[BillAdapter alloc] init];
    self.queryView.aCollectionView.delegate = _productAdapter;
    self.queryView.aCollectionView.dataSource = _productAdapter;
    self.queryView.aTableView.delegate = _queryAdapter;
    self.queryView.aTableView.dataSource = _queryAdapter;
    self.queryView.aCollectionView.backgroundColor = [UIColor clearColor];
    /*
     ConfigurationDelegate
     */
    self.queryView.nameField.delegate = _queryView;
    self.queryView.telField.delegate = _queryView;
    self.queryView.unitField.delegate = _queryView;
    [self.view addSubview:_queryView];
    /*
     Checkout screen
     */
    self.commitView = [[[NSBundle mainBundle] loadNibNamed:@"CreateView" owner:self options:nil] objectAtIndex:0];
    self.commitView.alpha = 0;
    self.commitView.frame = frame;
    self.commitView.type = MenuTypeCommit;
    self.commitView.delegate = self;
    [self.commitView.aCollectionView registerNib:[UINib nibWithNibName:@"productCell" bundle:nil] forCellWithReuseIdentifier:createCellIdentifier];
    [self.commitView.aTableView registerNib:[UINib nibWithNibName:@"BillCell" bundle:nil] forCellReuseIdentifier:billCellIdentifier];
    self.commitAdapter = [[BillAdapter alloc] init];
    self.commitView.aCollectionView.delegate = _productAdapter;
    self.commitView.aCollectionView.dataSource = _productAdapter;
    self.commitView.aTableView.delegate = _commitAdapter;
    self.commitView.aTableView.dataSource = _commitAdapter;
    self.commitView.aCollectionView.backgroundColor = [UIColor clearColor];
    /*
     ConfigurationDelegate
     */
    self.commitView.nameField.delegate = _commitView;
    self.commitView.telField.delegate = _commitView;
    self.commitView.unitField.delegate = _commitView;
    [self.view addSubview:_commitView];

    
    self.baseView = _announceView;
    [self.view bringSubviewToFront:_announceView];
}

#pragma mark - Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.menuViewController presentFromViewController:self panGestureRecognizer:sender];
}

#pragma mark - MenuOptionDelegate

- (void)menu:(MenuTableViewController *)menu didPickWithOption:(PMenuOption)option
{
    switch (option)
    {
        case PMenuOptionAnnounce:
            [self.view bringSubviewToFront:_announceView];
            [_baseView hide];
            [_announceView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            self.baseView = _announceView;
            break;
        case PMenuOptionCreate:
            [self.view bringSubviewToFront:_createView];
            [_baseView hide];
            [_createView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            self.baseView = _createView;
            break;
        case PMenuOptionModify:
            [self.view bringSubviewToFront:_modifyView];
            [_baseView hide];
            [_modifyView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            self.baseView = _modifyView;
            break;
        case PMenuOptionSubTotal:
            [self.view bringSubviewToFront:_commitView];
            [_baseView hide];
            [_commitView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            self.baseView = _commitView;
            break;
        case PMenuOptionQuery:
            [self.view bringSubviewToFront:_queryView];
            [_baseView hide];
            [_queryView performSelector:@selector(show) withObject:nil afterDelay:0.5];
            self.baseView = _queryView;
            break;
        default:
            
            break;
    }
    [menu dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CreateViewDelegate
- (void)switchCategory:(NSString *)category
{
    _productAdapter.category = category;
    [_createView.aCollectionView reloadData];
}

@end
