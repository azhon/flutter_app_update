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
    
    }else if([call.method isEqualToString:@"cancel"]){
        NSLog(@"取消");
    }
}
@end
