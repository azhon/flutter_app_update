///数据实体
class UpdateModel {
  ///下载地址
  final String apkUrl;

  ///下载好的apk名称
  final String apkName;

  ///通知栏的小图标,这里传入的是mipmap文件下的图片名称 eg:ic_launcher.png则传入ic_launcher
  final String smallIcon;

  ///ios 下载链接
  final String iOSUrl;

  ///新安装包md5文件校验（32位)，校验重复下载
  final String? apkMD5;

  ///是否需要显示通知栏进度(默认为true)
  final bool showNotification;

  ///下载完成是否自动弹出安装页面 (默认为true)
  final bool jumpInstallPage;

  ///下载开始时是否提示 "正在后台下载新版本…" (默认为true)
  final bool showBgdToast;

  UpdateModel(
    this.apkUrl,
    this.apkName,
    this.smallIcon,
    this.iOSUrl, {
    this.apkMD5,
    this.showNotification = true,
    this.jumpInstallPage = true,
    this.showBgdToast = true,
  });

  ///转json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apkUrl'] = apkUrl;
    data['apkName'] = apkName;
    data['smallIcon'] = smallIcon;
    data['iOSUrl'] = iOSUrl;
    data['apkMD5'] = apkMD5 ?? '';
    data['showNotification'] = showNotification;
    data['jumpInstallPage'] = jumpInstallPage;
    data['showBgdToast'] = showBgdToast;
    return data;
  }
}
