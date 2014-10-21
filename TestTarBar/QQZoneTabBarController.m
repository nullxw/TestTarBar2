//
//
//
//
//  Created by zzc on 14-10-16.
//
//

#import "QQZoneTabBarController.h"

#import "Test1ViewController.h"
#import "Test2ViewController.h"
#import "Test3ViewController.h"
#import "Test4ViewController.h"


@interface QQZoneTabBarController ()

@property(nonatomic, strong)UIImageView *tabBarIndicator;

- (void)addCenterButton;
- (void)addTabBarIndicator;
- (CGFloat) horizontalLocationFor:(NSUInteger)tabIndex;

@end

@implementation QQZoneTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.nav1 = [self viewControllerWithTabTitle:@"动态"
                                       ClassName:@"Test1ViewController"
                                       imageName:@"tabbar_icon_auth"
                               selectedImageName:@"tabbar_icon_auth_click"];
    self.nav2 = [self viewControllerWithTabTitle:@"与我相关"
                                         ClassName:@"Test2ViewController"
                                         imageName:@"tabbar_icon_at"
                                 selectedImageName:@"tabbar_icon_at_click"];
    self.nav3 = [self viewControllerWithTabTitle:@"我的空间"
                                       ClassName:@"Test3ViewController"
                                       imageName:@"tabbar_icon_space"
                               selectedImageName:@"tabbar_icon_space_click"];
    self.nav4 = [self viewControllerWithTabTitle:@"玩吧"
                                       ClassName:@"Test4ViewController"
                                       imageName:@"tabbar_icon_more"
                               selectedImageName:@"tabbar_icon_more_click"];
    
    self.viewControllers = [NSArray arrayWithObjects:
                            self.nav1,
                            self.nav2,
                            [self viewControllerWithTabTitle:@""
                                                   ClassName:nil
                                                   imageName:nil
                                           selectedImageName:nil],
                            self.nav3,
                            self.nav4, nil];

    
    
    [self addCenterButton];
    [self addTabBarIndicator];
   
    
}


-(UINavigationController *) viewControllerWithTabTitle:(NSString *)title
                                      ClassName:(NSString *)className
                                      imageName:(NSString *)imgName
                              selectedImageName:(NSString *)selectedImgName
{
    
    UIViewController* viewController = nil;
    
    if (className != nil) {
        Class class = NSClassFromString(className);
        id vcObj = [[class alloc] init];
        viewController = (UIViewController *)vcObj;   //[[UIViewController alloc] init];
    } else {
        viewController = [[UIViewController alloc] init];
    }
    
    //[viewController.view setBackgroundColor:[UIColor redColor]];
    viewController.tabBarItem = [self createTabBarItemWithTitle:title
                                                      imageName:imgName
                                              selectedImageName:selectedImgName];
    //return viewController;
    UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:viewController];
    return nav;
}


// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
                 BackgroundImage:(UIImage*)backgroundImage highlightBackgroundImage:(UIImage*)highlightBackgroundImage
{
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, backgroundImage.size.width, backgroundImage.size.height);
    
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightBackgroundImage forState:UIControlStateHighlighted];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    button.center = CGPointMake(self.tabBar.center.x, self.tabBar.frame.size.height/2 - heightDifference/2.0);
    
    [self.tabBar addSubview:button];
}


- (UITabBarItem *)createTabBarItemWithTitle:(NSString *)title
                                  imageName:(NSString *)imgName
                          selectedImageName:(NSString *)selectedImgName
{
    UITabBarItem *tabbarItem = nil;
    UIImage *image = [UIImage imageNamed:imgName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImgName];
    
    
    tabbarItem = [[UITabBarItem alloc] initWithTitle:title
                                               image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                       selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    return tabbarItem;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}




- (void)updateTabBarIndicator
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    
    //重置center
    self.tabBarIndicator.center =  CGPointMake([self horizontalLocationFor:self.selectedIndex], self.tabBarIndicator.center.y);
    [UIView commitAnimations];
}



#pragma mark - Private

-(void)addCenterButton
{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"tabbar_btn"]
                    highlightImage:[UIImage imageNamed:@"tabbar_btn_click"]
                   BackgroundImage:[UIImage imageNamed:@"tabbar_bg_middle"]
          highlightBackgroundImage:[UIImage imageNamed:@"tabbar_bg_middle"]];
    
}

- (void)addTabBarIndicator
{
    UIImage* tabBarIndicatorImage = [UIImage imageNamed:@"tabbar_indicator"];
    CGFloat verticalLocation = self.tabBar.frame.size.height - tabBarIndicatorImage.size.height;
    
    //初始化tabBarIndicator
    self.tabBarIndicator = [[UIImageView alloc] initWithImage:tabBarIndicatorImage];
    self.tabBarIndicator.frame = CGRectMake(0, verticalLocation, tabBarIndicatorImage.size.width, tabBarIndicatorImage.size.height);
    self.tabBarIndicator.center = CGPointMake([self horizontalLocationFor:0], self.tabBarIndicator.center.y);
    
    [self.tabBar addSubview:self.tabBarIndicator];
}


- (CGFloat) horizontalLocationFor:(NSUInteger)tabIndex
{
    CGFloat tabItemWidth = self.tabBar.frame.size.width / self.tabBar.items.count;
    CGFloat halfBarItemWidth = tabItemWidth/2.0;
    return tabIndex * tabItemWidth + halfBarItemWidth;
}

@end
