//
//  Test4ViewController.m
//  TestTarBar
//
//  Created by zzc on 14-10-21.
//  Copyright (c) 2014年 zzc. All rights reserved.
//

#import "Test4ViewController.h"
#import "Test5ViewController.h"
#import "QQZoneTabBarController.h"

@interface Test4ViewController ()
{
    NSInteger count;
}

@end

@implementation Test4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    count = 0;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    count++;
    if (count%2 == 0) {
        self.tabBarController.selectedIndex = 3;
        [(QQZoneTabBarController *)self.tabBarController updateTabBarIndicator];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDone:(id)sender {
    
    Test5ViewController *vc = [[Test5ViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

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
