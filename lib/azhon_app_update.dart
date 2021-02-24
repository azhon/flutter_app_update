import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_update/update_model.dart';

class AzhonAppUpdate {
  static const MethodChannel _channel = const MethodChannel('azhon_app_update');
  static const EventChannel _listenerChannel =
      const EventChannel('azhon_app_update_listener');
  static StreamSubscription _listenerStream;

  ///获取应用的versionCode
  static Future<int> get getVersionCode async {
    return await _channel.invokeMethod('getVersionCode');
  }

  ///获取应用的versionName
  static Future<String> get getVersionName async {
    return await _channel.invokeMethod('getVersionName');
  }

  ///更新
  static Future<dynamic> update(UpdateModel model) async {
    return await _channel.invokeMethod('update', {
      'model': model.toJson(),
    });
  }

  ///下载监听
  static listener() {
    _listenerStream = _listenerChannel.receiveBroadcastStream().listen((data) {
      Map<String, dynamic> map = jsonDecode(data);
      if (map['type'] == 'done') {
        print(map['apk']);
      }
    });
  }

  ///取消
  static Future<bool> get cancel async {
    return await _channel.invokeMethod('cancel');
  }

  static dispose() {
    _listenerStream?.cancel();
  }
}
