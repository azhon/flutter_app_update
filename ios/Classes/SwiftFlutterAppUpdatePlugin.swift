import Flutter
import UIKit

public class SwiftFlutterAppUpdatePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "azhon_app_update", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterAppUpdatePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        let event = FlutterEventChannel(name: "azhon_app_update_listener", binaryMessenger: registrar.messenger())
        event.setStreamHandler((EventStreamHandler() as! FlutterStreamHandler & NSObjectProtocol))
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getVersionCode":
            let dictionary=Bundle.main.infoDictionary
            let code=dictionary?["CFBundleVersion"] as! String
            result(Int(code))
        case "getVersionName":
            let dictionary2=Bundle.main.infoDictionary
            result(dictionary2?["CFBundleShortVersionString"])
        case "update":
            update(call)
        case "cancel":
            NSLog("取消")
        default:
            break
        }
    }
    private func update(_ call: FlutterMethodCall){
    }
    
    class EventStreamHandler: FlutterStreamHandler {
        private var eventSink:FlutterEventSink? = nil
        func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
            eventSink = events
            return nil
        }
        
        func onCancel(withArguments arguments: Any?) -> FlutterError? {
            eventSink = nil
            return nil
        }
        
    }
}
