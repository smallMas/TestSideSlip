//
//  FirstViewController.m
//  TestSideSlip
//
//  Created by 琥珀先知 on 13-9-10.
//  Copyright (c) 2013年 琥珀先知. All rights reserved.
//

#import "FirstViewController.h"
#import "MFSideMenuContainerViewController.h"

@interface FirstViewController ()
- (void)setupMenuBarButtonItems;
@end

@implementation FirstViewController

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
    [self setupMenuBarButtonItems];
}

- (void)setupMenuBarButtonItems {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"]
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:@selector(leftSideMenuButtonPressed:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
//        [self setupMenuBarButtonItems];
    }];
}

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.tabBarController.parentViewController;
}
@end
