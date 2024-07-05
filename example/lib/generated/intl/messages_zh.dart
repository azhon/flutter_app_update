// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("一个简单好用的版本更新库"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消下载"),
        "dialogCancel": MessageLookupByLibrary.simpleMessage("取消"),
        "dialogConfirm": MessageLookupByLibrary.simpleMessage("升级"),
        "dialogContent": MessageLookupByLibrary.simpleMessage(
            "1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构"),
        "dialogTitle": MessageLookupByLibrary.simpleMessage("发现新版本"),
        "end": MessageLookupByLibrary.simpleMessage("结束"),
        "forceUpgrade": MessageLookupByLibrary.simpleMessage("强制更新"),
        "getCode": MessageLookupByLibrary.simpleMessage("获取VersionCode"),
        "getName": MessageLookupByLibrary.simpleMessage("获取VersionName"),
        "upgrade": MessageLookupByLibrary.simpleMessage("更新")
      };
}
