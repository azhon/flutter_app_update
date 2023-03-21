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
        result(@(YES));
    }
}
#pragma 版本更新
-(void)update:(id)arguments{
    NSDictionary *model = arguments[@"model"];
    NSString *iOSUrl= model[@"iOSUrl"];
    //直接打开appStore
    [self openAppStore: iOSUrl];
}
#pragma 打开AppStore
-(void)openAppStore:(NSString *)iOSUrl{
    NSString *url = [iOSUrl stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@""] invertedSet]];
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
