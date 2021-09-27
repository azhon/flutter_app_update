import 'package:flutter/material.dart';
import 'package:flutter_app_update/azhon_app_update.dart';
import 'package:flutter_app_update/update_model.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('一个简单好用的版本更新库')),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
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
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '使用说明：三个方式不能并行 请等待一个方式下载完成在使用其他方式',
            style: TextStyle(color: Color(0xFFD81B60), fontSize: 14),
          ),
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
          Divider(height: 10),
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
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: Text(text, style: TextStyle(color: Colors.white)),
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
            title: Text('发现新版本'),
            content: Text(
                '1.支持Android M N O P Q\n2.支持自定义下载过程\n3.支持 设备>=Android M 动态权限的申请\n4.支持通知栏进度条展示\n5.支持文字国际化'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('升级'),
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
      "1.支持Android M N O P Q\n2.支持自定义下载过程\n3.支持 设备>=Android M 动态权限的申请\n4.支持通知栏进度条展示\n5.支持文字国际化",
      showNewerToast: true,
      apkVersionCode: 2,
      apkVersionName: "2.1.8",
      apkSize: "20.4",
      appStoreId: '抖音/id1142110895',
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
      "1.支持Android M N O P Q\n2.支持自定义下载过程\n3.支持 设备>=Android M 动态权限的申请\n4.支持通知栏进度条展示\n5.支持文字国际化",
      appStoreId: '抖音/id1142110895',
      showiOSDialog: showiOSDialog,
    );
    AzhonAppUpdate.update(model).then((value) => print(value));
  }
}
