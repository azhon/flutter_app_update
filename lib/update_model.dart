///数据实体
class UpdateModel {
  ///下载地址
  final String apkUrl;

  ///下载好的apk名称
  final String apkName;

  ///通知栏的小图标,这里传入的是mipmap文件下的图片名称 eg:ic_launcher.png则传入ic_launcher
  final String smallIcon;

  ///-----------------以上3个属性为必须设置，以下属性为可选-----------------
  ///------------当设置了VersionCode的值时会自动判断是否需要更新------------

  ///要更新apk的versionCode
  final int? apkVersionCode;

  ///显示给用户的版本号
  final String? apkVersionName;

  ///更新描述
  final String apkDescription;

  ///安装包大小 单位 M
  final String? apkSize;

  ///新安装包md5文件校验（32位)，校验重复下载
  final String? apkMD5;

  ///是否提示用户 "当前已是最新版本"(默认为false)
  final bool showNewerToast;

  ///是否需要显示通知栏进度(默认为true)
  final bool showNotification;

  ///下载完成是否自动弹出安装页面 (默认为true)
  final bool jumpInstallPage;

  ///下载开始时是否提示 "正在后台下载新版本…" (默认为true)
  final bool showBgdToast;

  ///是否强制升级(默认为false)
  final bool forcedUpgrade;

  ///ios 下载链接
  final String? iOSUrl;

  ///ios 是否显示对话框
  final bool showiOSDialog;

  UpdateModel(
    this.apkUrl,
    this.apkName,
    this.smallIcon,
    this.apkDescription, {
    this.apkVersionCode,
    this.apkVersionName,
    this.apkSize,
    this.apkMD5,
    this.showNewerToast = false,
    this.showNotification = true,
    this.jumpInstallPage = true,
    this.showBgdToast = true,
    this.forcedUpgrade = false,
    this.showiOSDialog = true,
    this.iOSUrl,
  });

  ///转json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['apkUrl'] = this.apkUrl;
    data['apkName'] = this.apkName;
    data['smallIcon'] = this.smallIcon;
    data['apkVersionCode'] = this.apkVersionCode ?? '';
    data['apkVersionName'] = this.apkVersionName ?? '';
    data['apkDescription'] = this.apkDescription;
    data['apkSize'] = this.apkSize ?? '';
    data['apkMD5'] = this.apkMD5 ?? '';
    data['showNewerToast'] = this.showNewerToast;
    data['showNotification'] = this.showNotification;
    data['jumpInstallPage'] = this.jumpInstallPage;
    data['showBgdToast'] = this.showBgdToast;
    data['forcedUpgrade'] = this.forcedUpgrade;
    data['showiOSDialog'] = this.showiOSDialog;
    data['iOSUrl'] = this.iOSUrl ?? '';
    return data;
  }
}
