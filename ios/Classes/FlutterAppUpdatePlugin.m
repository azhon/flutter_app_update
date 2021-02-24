#import "FlutterAppUpdatePlugin.h"
#if __has_include(<flutter_app_update/flutter_app_update-Swift.h>)
#import <flutter_app_update/flutter_app_update-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_app_update-Swift.h"
#endif

@implementation FlutterAppUpdatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAppUpdatePlugin registerWithRegistrar:registrar];
}
@end
