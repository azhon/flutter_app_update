// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage(
            "A simple app update flutter package"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel download"),
        "dialogCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "dialogConfirm": MessageLookupByLibrary.simpleMessage("Upgrade"),
        "dialogContent": MessageLookupByLibrary.simpleMessage(
            "1.Support Android 4.1 and above\n2.Support for custom download process\n3.Support notification bar progress\n4.Support internationalization\n5.Use Kotlin Coroutines"),
        "dialogTitle": MessageLookupByLibrary.simpleMessage("New version"),
        "end": MessageLookupByLibrary.simpleMessage("end"),
        "forceUpgrade": MessageLookupByLibrary.simpleMessage("Force Upgrade"),
        "getCode": MessageLookupByLibrary.simpleMessage("Get VersionCode"),
        "getName": MessageLookupByLibrary.simpleMessage("Get VersionName"),
        "upgrade": MessageLookupByLibrary.simpleMessage("Upgrade"),
        "install": MessageLookupByLibrary.simpleMessage("Install Apk")
      };
}
