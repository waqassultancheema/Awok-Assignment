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
@interface HomeViewController ()

@property (nonatomic,strong) HomeCollectionViewDataSource *dataSource;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[HomeCollectionViewDataSource alloc] init];
    
    [self sendHomeRequest];
    // Do any additional setup after loading the view.
}

- (void)sendHomeRequest {
    HttpManager *manager = [[HttpManager alloc] init];
    NSDictionary *dict = [[NSDictionary alloc] init];
    [manager getHomeData:dict :^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
