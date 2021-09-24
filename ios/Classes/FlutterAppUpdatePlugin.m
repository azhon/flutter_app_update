#import "FlutterAppUpdatePlugin.h"

@implementation FlutterAppUpdatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"azhon_app_update"
                                     binaryMessenger:[registrar messenger]];
    FlutterAppUpdatePlugin* instance = [[FlutterAppUpdatePlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"getVersionCode"]){
        NSString *versionCode = NSBundle.mainBundle.infoDictionary[@"CFBundleVersion"];
        result(@([versionCode intValue]));
    } else if([call.method isEqualToString:@"getVersionName"]){
        NSString *versionName = NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"];
        result(versionName);
    }else if([call.method isEqualToString:@"update"]){
        [self update:call.arguments];
    }else if([call.method isEqualToString:@"cancel"]){
        NSLog(@"取消下载");
    }
}
#pragma 版本更新
-(void)update:(id)arguments{
    NSDictionary *model = arguments[@"model"];
    NSString *apkDescription= model[@"apkDescription"];
    NSString *appStoreId= model[@"appStoreId"];
    bool showiOSDialog = [[model objectForKey:@"showiOSDialog"] boolValue];
    bool forcedUpgrade = [[model objectForKey:@"forcedUpgrade"] boolValue];
    //不显示对话框，直接打开appStore
    if (!showiOSDialog) {
        [self openAppStore: appStoreId];
        return;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"发现新版本" message:apkDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *conform = [UIAlertAction actionWithTitle:@"升级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openAppStore: appStoreId];
    }];
    //强制更新
    if (!forcedUpgrade) {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击取消");
        }];
        [alert addAction:cancel];
    }
    [alert addAction:conform];
    [[self findViewController:nil] presentViewController:alert animated:YES completion:nil];
}
#pragma 打开AppStore
-(void)openAppStore:(NSString *)appId{
    NSString *name = [appId stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"?!@#$^&%*+,:;='\"`<>()[]{}/\\| "] invertedSet]];
    NSString *url=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/%@",name];
    NSLog(@"打开AppStore：%@",url);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

#pragma 获取UIViewController 然后可以跳转
-(UIViewController *)findViewController:(UIWindow *)window {
    UIWindow *windowToUse = window;
    if (windowToUse == nil) {
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if (window.isKeyWindow) {
                windowToUse = window;
                break;
            }
        }
    }
    UIViewController *topController = windowToUse.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}
@end
