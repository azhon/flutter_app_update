### 一、版本升级功能依赖于[AppUpdate](https://github.com/azhon/AppUpdate)，所以升级相关的文档看这边[文档说明](https://github.com/azhon/AppUpdate/blob/master/README.md) ｜ [English Doc](https://github.com/azhon/AppUpdate/blob/master/README-EN.md)

### 二、使用说明
- 1、依赖此库

```yaml
dependencies:
  flutter_app_update: #[前往此处查看版本号](https://pub.dev/packages/flutter_app_update/install)
```

- 2、创建`UpdateModel`设置下载地址

```dart
UpdateModel model = UpdateModel("http://xxx.com/xx.apk", "flutterUpdate.apk", "ic_launcher");
AzhonAppUpdate.update(model).then((value) => print(value));
```

- 3、"ic_launcher"指的是在`Android`项目中在`res/mipmap`文件夹下的图片

- 4、监听下载过程

```dart
@override
void initState() {
  super.initState();
  AzhonAppUpdate.listener((map) {
    print(map['type']);
  });
}
```
- 5、回调事件如下：
    - `onButtonClick` 对话框点击事件通知
        - 扩展数据 `id`Int类型：0：升级按钮点击，1：取消按钮点击
    - `start` 开始下载通知
        - 无扩展数据
    - `downloading` 下载中
        - 扩展数据 `max`、`progress`Int类型，max:总大小、progress:当前下载进度
    - `done` 下载完成通知
        - 扩展数据 `apk`String类型 安装包存储路径
    - `cancel` 取消下载通知 
        - 无扩展数据
    - `error` 下载出错通知
        - 扩展数据 `exception`String类型 下载出错信息

### 三、由于`iOS`需要前往`AppStore`下载更新，所以`iOS`平台在`UpdateModel`中需要传递`appStoreId`参数，然后跳转至`AppStore`下载
### 四、效果图

<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img1.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img2.png" width="300">
<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img3.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img4.png" width="300">
