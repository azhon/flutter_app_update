### 版本升级功能依赖于[AppUpdate](https://github.com/azhon/AppUpdate)，所以升级相关的文档看这边[文档说明](https://github.com/azhon/AppUpdate/blob/master/README.md)
## 目录

* [效果图](#效果图)
* [使用提醒](#使用提醒)
* [使用步骤](#使用步骤)


### 效果图

<img src="https://github.com/azhon/FlutterAppUpdate/blob/main/example/img/img1.png" width="300">　<img src="https://github.com/azhon/FlutterAppUpdate/blob/main/example/img/img2.png" width="300">
<img src="https://github.com/azhon/FlutterAppUpdate/blob/main/example/img/img3.png" width="300">　<img src="https://github.com/azhon/FlutterAppUpdate/blob/main/example/img/img4.png" width="300">

### 使用步骤

#### 第一步： `app/build.gradle`进行依赖

```groovy
implementation 'com.azhon:appupdate:3.0.3'
```

- 如果你使用的是`AndroidX`，请依赖`appupdateX`

```groovy
implementation 'com.azhon:appupdateX:3.0.3'
```
