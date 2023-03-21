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
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      "https://imtt.dd.qq.com/16891/apk/FA48766BA12A41A1D619CB4B152889C6.apk?fsname=com.estrongs.android.pop_4.2.3.3_10089.apk&csr=1bbd";

  @override
  void initState() {
    super.initState();
    AzhonAppUpdate.listener((map) {
      debugPrint(map['type']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _item('更新', () {
            _showUpdateDialog(false);
          }),
          _item('强制更新', () {
            _showUpdateDialog(true);
          }),
          _item('取消下载', () {
            AzhonAppUpdate.cancel.then((value) {
              debugPrint('取消下载结果 = $value');
            });
          }),
          const Divider(height: 10),
          _item('获取VersionCode', () {
            AzhonAppUpdate.getVersionCode.then((value) {
              debugPrint('获取到的versionCode = $value');
            });
          }),
          _item('获取VersionName', () {
            AzhonAppUpdate.getVersionName.then((value) {
              debugPrint('获取到的versionName = $value');
            });
          }),
        ],
      ),
    );
  }

  ///Flutter侧处理升级对话框
  ///[forcedUpgrade] 是否强制升级
  _showUpdateDialog(bool forcedUpgrade) {
    showDialog(
      context: context,
      barrierDismissible: !forcedUpgrade,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(!forcedUpgrade),
          child: AlertDialog(
            title: const Text('发现新版本'),
            content: const Text(
                '1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构'),
            actions: <Widget>[
              if (!forcedUpgrade)
                TextButton(
                  child: const Text('取消'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              TextButton(
                child: const Text('升级'),
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
    AzhonAppUpdate.update(model).then((value) => debugPrint('$value'));
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
