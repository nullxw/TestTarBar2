//
//  AppDelegate.m
//  TestTarBar
//
//  Created by zzc on 14-10-16.
//  Copyright (c) 2014年 zzc. All rights reserved.
//

#import "AppDelegate.h"

#import "QQZoneTabBarController.h"

@interface AppDelegate ()

@property(nonatomic, strong)UIImageView *tabBarIndicator;
@property(nonatomic, strong)QQZoneTabBarController *rootTabBarController;

@end

@implementation AppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor redColor]];
    
    QQZoneTabBarController  *zoneVC = [[QQZoneTabBarController alloc] init];
    zoneVC.delegate = self;
    [self.window setRootViewController:zoneVC];
    self.rootTabBarController = zoneVC;

    [self changeTabBarStyle];

    [self.window makeKeyAndVisible];
    return YES;
}


- (void)changeTabBarStyle
{
    
    //设置tabbar背景图片
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
    
    //去除tabbar在iOS7显示的时候在顶部出现的黑线
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

    //修改tabbarItem的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}
                                             forState:UIControlStateSelected];

}


- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"viewcontroller = %@", NSStringFromClass([viewController class]));
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.rootTabBarController updateTabBarIndicator];
    });
}



@end
