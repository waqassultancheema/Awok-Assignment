//
//  HomeViewController.m
//  AwokDemoApp
//
//  Created by Waqas Sultan on 7/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

#import "HomeViewController.h"
#import "HttpManager.h"
#import "HomeCollectionViewDataSource.h"
#import "MMMaterialDesignSpinner.h"
#import "UIView+Toast.h"
@interface HomeViewController ()<HomeCollectionViewDataSourceDelegate>

@property (nonatomic,strong) HomeCollectionViewDataSource *dataSource;
@property (nonatomic,strong) MMMaterialDesignSpinner *spinnerView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureActivityIndictor];
    self.dataSource = [[HomeCollectionViewDataSource alloc] init];
    self.dataSource.delegate  = self;
    _collectionView.dataSource = self.dataSource;
    _collectionView.delegate = self.dataSource;
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

    [self sendHomeRequest:@"1"];
    // Do any additional setup after loading the view.
}

- (void)configureActivityIndictor {
    // Initialize the progress view
    self.spinnerView = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
    
    // Set the line width of the spinner
    self.spinnerView.lineWidth = 1.5f;
    // Set the tint color of the spinner
    self.spinnerView.tintColor = [UIColor redColor];
    
    // Add it as a subview
    [self.view addSubview:self.spinnerView];
    
 

    // Start & stop animations
  
}
- (void)sendHomeRequest:(NSString *)pageNo {
    HttpManager *manager = [[HttpManager alloc] init];
      [self.spinnerView startAnimating];
    __weak HomeViewController *weakSelf = self;

    [manager getHomeDataWithPageNo:pageNo :^(id responseObject) {
        [weakSelf sendFlashRequest:weakSelf];
    } failure:^(NSError *error) {
        [weakSelf sendFlashRequest:weakSelf];

    }];
}

- (void)sendFlashRequest:(HomeViewController *)viewController {
    HttpManager *manager = [[HttpManager alloc] init];
    [manager getFlashData:^(id responseObject) {
        [viewController.collectionView reloadData];
        [viewController.spinnerView stopAnimating];

    } failure:^(NSError *error) {
        [viewController.collectionView reloadData];
        [viewController.spinnerView stopAnimating];

        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buyButtonSelected:(NSInteger)index {
    [self.view makeToast:@"Add to Cart"];

}

-(void)loadMoreDataFromServer:(NSInteger)pageNo {
    HttpManager *manager = [[HttpManager alloc] init];
    [self.spinnerView startAnimating];
    __weak HomeViewController *weakSelf = self;
    if (pageNo > 0) {
        NSString *pageNumber = [NSString stringWithFormat:@"%ld",pageNo];
        [manager getHomeDataWithPageNo:pageNumber :^(id responseObject) {
            weakSelf.dataSource.waiting = false;
            [weakSelf.collectionView reloadData];
            [weakSelf.spinnerView stopAnimating];
        } failure:^(NSError *error) {
            weakSelf.dataSource.waiting = false;
            [weakSelf.collectionView reloadData];
            [weakSelf.spinnerView stopAnimating];

        }];
    } else {
        
        NSString *pageNumber = [NSString stringWithFormat:@"%ld",pageNo];
        [manager getHomeDataWithPageNo:pageNumber :^(id responseObject) {
            weakSelf.dataSource.waiting = false;
            [weakSelf.collectionView reloadData];
            [weakSelf.spinnerView stopAnimating];
        } failure:^(NSError *error) {
            weakSelf.dataSource.waiting = false;
            [weakSelf.collectionView reloadData];
            [weakSelf.spinnerView stopAnimating];
            
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
