### 一、使用说明
- Android这一侧的下载依赖[AppUpdate库](https://github.com/azhon/AppUpdate)
- 添加依赖
```yaml
dependencies:
  flutter_app_update: ^latest_version
```

- 创建`UpdateModel`设置下载地址

```dart
 UpdateModel model = UpdateModel(
   url,
   "flutterUpdate.apk",
   /// android res/mipmap 目录下的图片名称
   "ic_launcher",
   'https://itunes.apple.com/cn/app/抖音/id1142110895',
 );
 AzhonAppUpdate.update(model).then((value) => debugPrint('$value'));
```
> 关于`UpdateModel`各字段的释义详情请看代码注释
- 监听下载过程

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
	    <th>监听类型(type)</th>
	    <th>扩展字段数据</th>
	    <th>数据类型</th>
	    <th>备注</th>
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


### 三、效果图

<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img1.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img2.png" width="300">
<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img3.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/img4.png" width="300">
