// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A simple app update flutter package`
  String get appTitle {
    return Intl.message(
      'A simple app update flutter package',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get upgrade {
    return Intl.message(
      'Upgrade',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Force Upgrade`
  String get forceUpgrade {
    return Intl.message(
      'Force Upgrade',
      name: 'forceUpgrade',
      desc: '',
      args: [],
    );
  }

  /// `Cancel download`
  String get cancel {
    return Intl.message(
      'Cancel download',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Get VersionCode`
  String get getCode {
    return Intl.message(
      'Get VersionCode',
      name: 'getCode',
      desc: '',
      args: [],
    );
  }

  /// `Get VersionName`
  String get getName {
    return Intl.message(
      'Get VersionName',
      name: 'getName',
      desc: '',
      args: [],
    );
  }

  /// `New version`
  String get dialogTitle {
    return Intl.message(
      'New version',
      name: 'dialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `1.Support Android 4.1 and above\n2.Support for custom download process\n3.Support notification bar progress\n4.Support internationalization\n5.Use Kotlin Coroutines`
  String get dialogContent {
    return Intl.message(
      '1.Support Android 4.1 and above\n2.Support for custom download process\n3.Support notification bar progress\n4.Support internationalization\n5.Use Kotlin Coroutines',
      name: 'dialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get dialogConfirm {
    return Intl.message(
      'Upgrade',
      name: 'dialogConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialogCancel {
    return Intl.message(
      'Cancel',
      name: 'dialogCancel',
      desc: '',
      args: [],
    );
  }

  /// `end`
  String get end {
    return Intl.message(
      'end',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `install`
  String get install {
    return Intl.message(
      'install',
      name: 'install',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
