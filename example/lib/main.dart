import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_update/flutter_app_update.dart';
import 'package:flutter_app_update_example/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Scaffold(
        appBar: AppBar(
          title: Builder(
            builder: (context) {
              return Text(
                S.of(context).appTitle,
                style: const TextStyle(fontSize: 16),
              );
            },
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      "https://imtt.dd.qq.com/16891/apk/FA48766BA12A41A1D619CB4B152889C6.apk?fsname=com.estrongs.android.pop_4.2.3.3_10089.apk&csr=1bbd";

  @override
  void initState() {
    super.initState();
    AzhonAppUpdate.listener((map) {
      debugPrint('app update listener: ${jsonEncode(map)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _item(S.of(context).upgrade, () {
            _showUpdateDialog(false);
          }),
          _item(S.of(context).forceUpgrade, () {
            _showUpdateDialog(true);
          }),
          _item(S.of(context).cancel, () {
            AzhonAppUpdate.cancel.then((value) {
              debugPrint('Cancel download status = $value');
            });
          }),
          const Divider(height: 10),
          _item(S.of(context).getCode, () {
            AzhonAppUpdate.getVersionCode.then((value) {
              debugPrint('versionCode result = $value');
            });
          }),
          _item(S.of(context).getName, () {
            AzhonAppUpdate.getVersionName.then((value) {
              debugPrint('versionName result = $value');
            });
          }),
        ],
      ),
    );
  }

  _showUpdateDialog(bool forcedUpgrade) {
    showDialog(
      context: context,
      barrierDismissible: !forcedUpgrade,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(!forcedUpgrade),
          child: AlertDialog(
            title: Text(S.of(context).dialogTitle),
            content: Text(S.of(context).dialogContent),
            actions: <Widget>[
              if (!forcedUpgrade)
                TextButton(
                  child: Text(S.of(context).dialogCancel),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              TextButton(
                child: Text(S.of(context).dialogConfirm),
                onPressed: () {
                  _appUpdate();
                  if (!forcedUpgrade) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _appUpdate() {
    UpdateModel model = UpdateModel(
      url,
      "flutterUpdate.apk",
      "ic_launcher",
      'https://itunes.apple.com/cn/app/抖音/id1142110895',
    );
    AzhonAppUpdate.update(model);
  }

  Widget _item(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: Text(text, style: const TextStyle(color: Colors.white)),
        onPressed: () => onPressed.call(),
      ),
    );
  }
}
