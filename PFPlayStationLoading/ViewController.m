//
//  ViewController.m
//  PFPlayStationLoading
//
//  Created by Cee on 9/21/16.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "ViewController.h"
#import "PFPlayStationLoadingView.h"

@interface ViewController ()
@property (nonatomic, strong) PFPlayStationLoadingView *squareLoadingView;
@property (nonatomic, strong) PFPlayStationLoadingView *horizontalLoadingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.squareLoadingView = [[PFPlayStationLoadingView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)
                                                                          sideLength:40
                                                                                type:PFPlayStationLoadingViewTypeSquare];
    self.squareLoadingView.center  = CGPointMake(self.view.center.x, self.view.center.y - 60);
    [self.view addSubview:self.squareLoadingView];
    [self.squareLoadingView startAnimating];
    
    self.horizontalLoadingView = [[PFPlayStationLoadingView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)
                                                                  sideLength:40
                                                                        type:PFPlayStationLoadingViewTypeHorizontal];
    self.horizontalLoadingView.center = CGPointMake(self.view.center.x, self.view.center.y + 60);
    [self.view addSubview:self.horizontalLoadingView];
    [self.horizontalLoadingView startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
