### [Chinese Doc](https://github.com/azhon/flutter_app_update/blob/main/README-CN.md)

### 一、Introduce
- Android update use [AppUpdate](https://github.com/azhon/AppUpdate) library
- Add to pubspec.yaml [pub versions](https://pub.dev/packages/flutter_app_update)
```yaml
dependencies:
  flutter_app_update: ^latest_version
```

- Create `UpdateModel` and set apk url

```dart
 UpdateModel model = UpdateModel(
   url,
   "flutterUpdate.apk",
   /// android res/mipmap icon name
   "ic_launcher",
   'https://itunes.apple.com/cn/app/xxxx',
 );
 AzhonAppUpdate.update(model).then((value) => debugPrint('$value'));
```
- Listener download

```dart
@override
void initState() {
  super.initState();
  AzhonAppUpdate.listener((map) {
    debugPrint('app update listener: ${jsonEncode(map)}');
  });
}
```

<table>
	<tr>
	    <th>Type</th>
	    <th>Keys</th>
	    <th>Type of data</th>
	    <th>Remark</th>
	</tr >
	<tr>
	    <td>onButtonClick</td>
	    <td>id</td>
	    <td>int</td>
	    <td>Update dialog button click event(0:confirm，1:cancel)</td>
	</tr>
	<tr>
	    <td>start</td>
	    <td>/</td>
	    <td>/</td>
	    <td>Start download</td>
	</tr>
	<tr>
	    <td rowspan="2">downloading</td>
	    <td>max</td>
	    <td>int</td>
	    <td>Downloading, apk file size </td>
	</tr>
	<tr>
	    <td>progress</td>
	    <td>int</td>
	    <td>Current progress</td>
	</tr>
	<tr>
	    <td>done</td>
	    <td>apk</td>
	    <td>String</td>
	    <td>Downloaded, apk path</td>
	</tr>
	<tr>
	    <td>cancel</td>
	    <td>/</td>
	    <td>/</td>
	    <td>Cancel download</td>
	</tr>
	<tr>
	    <td>error</td>
	    <td>exception</td>
	    <td>String</td>
	    <td>Download error</td>
	</tr>
</table>


### 三、Screenshot

<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/en/img1.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/en/img2.png" width="300">
<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/en/img3.png" width="300">　<img src="https://raw.githubusercontent.com/azhon/FlutterAppUpdate/main/example/img/en/img4.png" width="300">
