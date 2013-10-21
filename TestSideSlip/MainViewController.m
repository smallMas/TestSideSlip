//
//  MainViewController.m
//  TestSideSlip
//
//  Created by 琥珀先知 on 13-9-10.
//  Copyright (c) 2013年 琥珀先知. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    FirstViewController *firstController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UINavigationController *fristNavigation = [[UINavigationController alloc] initWithRootViewController:firstController];
    fristNavigation.tabBarItem.title = @"Frist";
    firstController.navigationItem.title = @"frist";
    
    
    UIViewController *secondController = [[UIViewController alloc] init];
    UIViewController *thirdController = [[UIViewController alloc] init];
    UIViewController *fourthController = [[UIViewController alloc] init];
    UIViewController *fifthController = [[UIViewController alloc] init];
    
    NSMutableArray *tabList = [[NSMutableArray alloc] initWithObjects:fristNavigation,secondController,thirdController,fourthController,fifthController, nil];
    self.viewControllers = tabList;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
