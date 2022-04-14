# fairdemo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.





按照 FlutterFair接入文档操作[Counting计数器](https://fair.58.com/zh/guide/counting-demo.html#%E9%A2%84%E8%A7%88%E6%95%88%E6%9E%9C)
    
# flutter2.5.0 接fair 问题
 * 1、flutter pub run build_runner build     
报错
```
   Failed to build build_runner:build_runner:
../../shared/opt/fvm/versions/2.5.0/.pub-cache/hosted/pub.flutter-io.cn/analyzer-0.41.2/lib/src/error/best_practices_verifier.dart:258:50: Error: The property 'displayString' is defined in multiple extensions for 'TargetKind' and neither is more specific.
 - 'TargetKind' is from 'package:meta/meta_meta.dart' ('../../shared/opt/fvm/versions/2.5.0/.pub-cache/hosted/pub.flutter-io.cn/meta-1.7.0/lib/meta_meta.dart').
Try using an explicit extension application of the wanted extension or hiding unwanted extensions from scope.
        var kindNames = kinds.map((kind) => kind.displayString).toList()
                                                 ^^^^^^^^^^^^^
../../shared/opt/fvm/versions/2.5.0/.pub-cache/hosted/pub.flutter-io.cn/analyzer-0.41.2/lib/src/error/best_practices_verifier.dart:1950:14: Context: This is one of the extension members.
  String get displayString {
             ^^^^^^^^^^^^^
../../shared/opt/fvm/versions/2.5.0/.pub-cache/hosted/pub.flutter-io.cn/meta-1.7.0/lib/meta_meta.dart:91:14: Context: This is one of the extension members.
  String get displayString {
             ^^^^^^^^^^^^^
../../shared/opt/fvm/versions/2.5.0/.pub-cache/hosted/pub.flutter-io.cn/analyzer-0.41.2/lib/src/error/best_practices_verifier.dart:260:36: Error: The getter 'commaSeparatedWithOr' isn't defined for the class 'List<dynamic>'.
 - 'List' is from 'dart:core'.
Try correcting the name to the name of an existing getter, or defining a getter or field named 'commaSeparatedWithOr'.
        var validKinds = kindNames.commaSeparatedWithOr;
                                   ^^^^^^^^^^^^^^^^^^^^
pub finished with exit code 1

```
报错分析：

查看 flutter 2.5.0 dart版本 是2.14.0
```$FLUTTER_ROOT/bin/cache/dart-sdk/version```

查看flutter 2.5.0依赖的meta 版本
```$FLUTTER_ROOT/packages/flutter/pubspec.yaml```


flutter 2.5.0
 &emsp; meta: 1.7.0



fair compiler
 &emsp; analyzer: ^0.41.2

analyzer: ^0.41.2
     &emsp;&emsp;&emsp; meta: ^1.2.3



```fair compiler  -> analyzer: ^0.41.2  ->  meta: ^1.2.3 ```
 与```flutter 2.5.0 ->   meta: 1.7.0``` 版本不匹配。 

 所以因为flutter 1.7.0版本的meta较高，导致 fair compiler不可用
 


* 2、flutter pub get     
没问题

* 3、使用模拟器运行

 ![image.png](https://upload-images.jianshu.io/upload_images/45726-3c33e1d5aff22f98.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

但是用file 查看
./fair/fair/ios/FairDynamicFlutter/Products/FairDynamicFlutter.framework/FairDynamicFlutter

```
fair/fair/ios/FairDynamicFlutter/Products/FairDynamicFlutter.framework/FairDynamicFlutter: Mach-O universal binary with 4 architectures: [arm_v7:Mach-O dynamically linked shared library arm_v7] [x86_64:Mach-O 64-bit dynamically linked shared library x86_64] [i386:Mach-O dynamically linked shared library i386] [arm64:Mach-O 64-bit dynamically linked shared library arm64]
/Volumes/huc/xx/fair/fair/ios/FairDynamicFlutter/Products/FairDynamicFlutter.fram
```
分明是支持4种架构
arm_v7
x86_64
i386
arm64

切到真机运行成功了
![image.png](https://upload-images.jianshu.io/upload_images/45726-9f5302617fde5225.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



 > fair compiler 


 fair compiler
flutter 2.5.0不兼容
```fair compiler  -> analyzer: ^0.41.2  ->  meta: ^1.2.3 ```
 与```flutter 2.5.0 ->   meta: 1.7.0``` 

flutter2.0.6兼容：
```fair compiler  -> analyzer: ^0.41.2  ->  meta: ^1.2.3 ```
 与```flutter 2.0.6 ->   meta: 1.3.0``` 

flutter 1.17.3不兼容
```fair compiler  -> analyzer: ^0.41.2  ->  meta: ^1.2.3 ```
 与```flutter 1.17.3 ->    meta: 1.1.8``` 


>  fair 

flutter 2.5.0 
 IOS插件 FairDynamicFlutter.framework 不支持 模拟器运行

# flutter 2.0.6接fair 问题

报错：
![flutter2.0.6pub get成功但是运行失败.jpg.jpg](https://upload-images.jianshu.io/upload_images/45726-8bfae3ae049ff000.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


|  flutter   | dart |
|  - | -  |
| flutter1.17.3    | dart 2.8.4 |
| flutter 1.22.4 | dart 2.10.4 |
| flutter 2.0.6 | dart 2.12.3 |
| flutter 2.2.2 | dart 2.13.3 |
| flutter 2.5.0 | dart 2.14.0 |


解决方法：

pubspec.yaml
~~```sdk: ">=2.10.4 <3.0.0"```改为  ``` sdk: ">=2.8.0 <3.0.0"```就够了~~

```
 sudo xattr -d com.apple.quarantine $FLUTTER_ROOT/bin/cache/artifacts/usbmuxd/iproxy
```
执行完上面命令后
2.8.0和2.10.4好像又都没问题了


终于算是运行成功了
* flutter  pub get 添加fair plugin 
* flutter pub run build_runner build 运行fair compiler生成fair 
 bundle
* fair plugin FairDynamicFlutter.framework 运行模拟器也没问题

![image.png](https://upload-images.jianshu.io/upload_images/45726-d61eb8a5b7bd32c9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



