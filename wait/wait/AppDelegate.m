//
//  AppDelegate.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "AppDelegate.h"
#import "UMengHandler.h"
#import "RYNavigationController.h"
#import "IndexViewController.h"
#import "IntroViewController.h"

@interface AppDelegate (){
    int _count;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor blackColor];
    
    //  程序设置
    [self programSetUp];
    
    //  主配置请求
    [self mainConfig];
    
    //  推送注册
    [self pushRegiste:launchOptions];
    
    if (_count == 1) {
        IntroViewController *intro = [[IntroViewController alloc]initWithNibName:nil bundle:nil];
        self.window.rootViewController = intro;
    }else{
        IndexViewController *indexVC = [[IndexViewController alloc]initWithNibName:nil bundle:nil];
        RYNavigationController *navi = [[RYNavigationController alloc]initWithRootViewController:indexVC];
        self.window.rootViewController = navi;
    }
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (void)programSetUp{
    // 启动友盟
    [UMengHandler launch];
    //  状态栏
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance]setBarTintColor:NAVICOLOR];
    //  导航返回键
    [[UINavigationBar appearance]setBackIndicatorImage:[UIImage imageNamed:@"fanhuijian.png"]];
    [[UINavigationBar appearance]setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"fanhuijian.png"]];
}
- (void)mainConfig{
    //  主配置请求
    NSString *urlStr = [NSString stringWithFormat:MAINCONFIG,VERSION];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:1 error:nil];
        NSDictionary *urlDic = [dic objectForKey:@"UrlConfig"];
        if (urlDic) {
            [[NSUserDefaults standardUserDefaults]setValue:urlDic forKey:@"MainConfigModel"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    
    //  获取运行次数
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    _count = [ud integerForKey:@"runCount"];
    [ud setInteger:++_count forKey:@"runCount"];
    //  同步数据
    [ud synchronize];
}
- (void)pushRegiste:(NSDictionary *)launchOptions{
    // 修饰类数组 (填充修饰的所有数组, 按照数组的先后顺序, 修饰pushHandle)
    NSArray *decorations = @[
                             @"DefaultPushHandle",
                             @"CustomPushHandle"
                             ];
    
    // 修饰类
    PushHandle *pushHandle = [[PushHandle pushHandle] decorateBy:decorations];
    
    // 注册, 处理
    [QBasePush registPushHandle:pushHandle];
    [QBasePush handleLaunchingOptions:launchOptions];

}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if ([application applicationState] != UIApplicationStateActive)
    {
        //FIXME:接受推送
    }
    
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [QBasePush uploadAPNsToken:deviceToken complete:^(id result, NSError *err) {
        
    }];
}
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
    NSLog(@"Push Register Error:%@", err.description);
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
