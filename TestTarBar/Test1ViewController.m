//
//  Test1ViewController.m
//  TestTarBar
//
//  Created by zzc on 14-10-21.
//  Copyright (c) 2014年 zzc. All rights reserved.
//

#import "Test1ViewController.h"
#import "QQZoneTabBarController.h"

@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onDone:(id)sender {
    
    
    self.tabBarController.selectedIndex = 3;
    [(QQZoneTabBarController *)self.tabBarController updateTabBarIndicator];
    
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
