import 'package:flutter/material.dart';
import 'package:flutter_app_update/azhon_app_update.dart';
import 'package:flutter_app_update/update_model.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('一个简单好用的版本更新库')),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      "https://imtt.dd.qq.com/16891/apk/FA48766BA12A41A1D619CB4B152889C6.apk?fsname=com.estrongs.android.pop_4.2.3.3_10089.apk&csr=1bbd";

  @override
  void initState() {
    super.initState();
    AzhonAppUpdate.listener((map) {
      print(map['type']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _item('使用自己的对话框更新', () {
            _useOwnerDialog();
          }),
          _item('使用版本库内置的对话框更新', () {
            _useBuiltInDialog(false);
          }),
          _item('简单使用', () {
            _simpleUse(true);
          }),
          _item('强制更新', () {
            _useBuiltInDialog(true);
          }),
          _item('取消下载', () {
            AzhonAppUpdate.cancel.then((value) {
              print('取消下载结果 = $value');
            });
          }),
          const Divider(height: 10),
          _item('获取VersionCode', () {
            AzhonAppUpdate.getVersionCode.then((value) {
              print('获取到的versionCode = $value');
            });
          }),
          _item('获取VersionName', () {
            AzhonAppUpdate.getVersionName.then((value) {
              print('获取到的versionName = $value');
            });
          }),
        ],
      ),
    );
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

  ///使用自己的对话框
  _useOwnerDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('发现新版本'),
            content: const Text(
                '1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构'),
            actions: <Widget>[
              TextButton(
                child: const Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('升级'),
                onPressed: () {
                  _simpleUse(false);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }).then((value) {});
  }

  ///使用内置对话框
  _useBuiltInDialog(bool forcedUpgrade) {
    UpdateModel model = UpdateModel(
      url,
      "flutterUpdate.apk",
      "ic_launcher",
      "1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构",
      showNewerToast: true,
      apkVersionCode: 300,
      apkVersionName: "V2.1.8",
      apkSize: "20.4MB",
      iOSUrl: 'https://itunes.apple.com/cn/app/抖音/id1142110895',
      showiOSDialog: true,
      forcedUpgrade: forcedUpgrade,
    );
    AzhonAppUpdate.update(model).then((value) => print(value));
  }

  ///简单使用
  _simpleUse(bool showiOSDialog) {
    UpdateModel model = UpdateModel(
      url,
      "flutterUpdate.apk",
      "ic_launcher",
      "1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构",
      iOSUrl: 'https://itunes.apple.com/cn/app/抖音/id1142110895',
      showiOSDialog: showiOSDialog,
    );
    AzhonAppUpdate.update(model).then((value) => print(value));
  }
}
