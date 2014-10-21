//
//  
//  
//
//  Created by zzc on 14-10-16.
//
//

#import <UIKit/UIKit.h>

@interface QQZoneTabBarController : UITabBarController


@property(nonatomic, strong)UINavigationController *nav1;
@property(nonatomic, strong)UINavigationController *nav2;
@property(nonatomic, strong)UINavigationController *nav3;
@property(nonatomic, strong)UINavigationController *nav4;


-(UINavigationController *) viewControllerWithTabTitle:(NSString *)title
                                      ClassName:(NSString *)className
                                      imageName:(NSString *)imgName
                              selectedImageName:(NSString *)selectedImgName;

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
                 BackgroundImage:(UIImage*)backgroundImage highlightBackgroundImage:(UIImage*)highlightBackgroundImage;

- (void)updateTabBarIndicator;  //更新indicator

@end
