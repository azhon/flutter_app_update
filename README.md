### 一、版本升级功能依赖于[AppUpdate](https://github.com/azhon/AppUpdate)，所以升级相关的文档看这边[文档说明](https://github.com/azhon/AppUpdate/blob/master/README.md) ｜ [English Doc](https://github.com/azhon/AppUpdate/blob/master/README-EN.md)

### 二、使用说明
- 1、依赖此库[前往此处查看版本号](https://pub.dev/packages/flutter_app_update/install)
```yaml
dependencies:
  flutter_app_update: ^version
```

- 2、创建`UpdateModel`设置下载地址

```dart
UpdateModel model = UpdateModel(
  url,
  "flutterUpdate.apk",
  "ic_launcher",
  "1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构",
  showNewerToast: true,
  apkVersionCode: 2,
  apkVersionName: "V2.1.8",
  apkSize: "20.4MB",
  iOSUrl: 'https://itunes.apple.com/cn/app/抖音/id1142110895',
);
AzhonAppUpdate.update(model).then((value) => print(value));
```

- 3、`ic_launcher`指的是在`Android`项目中在`res/mipmap`文件夹下的图片

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
<table>
	<tr>
	    <td>监听类型(type)</td>
	    <td>扩展字段数据</td>
	    <td>数据类型</td>
	    <td>备注</td>
	</tr >
	<tr>
	    <td>onButtonClick</td>
	    <td>id</td>
	    <td>int</td>
	    <td>对话框按钮点击通知(0:确定，1:取消)</td>
	</tr>
	<tr>
	    <td>start</td>
	    <td>/</td>
	    <td>/</td>
	    <td>开始下载通知</td>
	</tr>
	<tr>
	    <td rowspan="2">downloading</td>
	    <td>max</td>
	    <td>int</td>
	    <td>下载中通知，下载总大小</td>
	</tr>
	<tr>
	    <td>progress</td>
	    <td>int</td>
	    <td>当前下载进度</td>
	</tr>
	<tr>
	    <td>done</td>
	    <td>apk</td>
	    <td>String</td>
	    <td>下载完成通知，安装包路径</td>
	</tr>
	<tr>
	    <td>cancel</td>
	    <td>/</td>
	    <td>/</td>
	    <td>取消下载通知</td>
	</tr>
	<tr>
	    <td>error</td>
	    <td>exception</td>
	    <td>String</td>
	    <td>下载出错通知，错误信息</td>
	</tr>
</table>

### 三、由于iOS需要前往AppStore下载更新，所以iOS平台在UpdateModel中需要传递iOSUrl参数，然后跳转至AppStore下载
### 四、效果图

<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img1.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img2.png" width="300">
<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img3.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img4.png" width="300">
