import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

//第一步：添加注解：
// 修饰当前页面为一个动态bundle资源,只需添加@FairPatch()

//第二步：现在然我们生成bundle吧
//flutter pub run build_runner build

//编译成功后，在build/fair目录下找到同名bundle资源:
//
//.fair.bin 格式为release产物
//.fair.json 格式为debug产物
//.fair.metadata 格式为元数据，标记了源码与产物的关联信息
//.fair.js 格式为逻辑转换为JS后的产物
@FairPatch()
class IfEqualBoolPage extends StatefulWidget {
  var fairProps;

  IfEqualBoolPage(dynamic data) {
    fairProps = data;
  }

  @override
  _IfEqualBoolPageState createState() => _IfEqualBoolPageState();
}

class _IfEqualBoolPageState extends State<IfEqualBoolPage> {
  @FairProps()
  var fairProps;

  String _title;
  int _count;

  // JS生命周期方法--在JS加载完成自动调用
  void onLoad() {
    _title = fairProps['pageName'];
    _count = fairProps['count'];
  }

  void onTapText() {
    _count = _count + 1;
    setState(() {});
  }

  // 逻辑方法
  bool _countCanMod2() {
    return _count % 2 == 1;
  }

  @override
  void initState() {
    super.initState();
    fairProps = widget.fairProps;
    onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sugar.ifEqualBool 为逻辑和布局混编场景下的语法糖
            Sugar.ifEqualBool(_countCanMod2(),
                falseValue: Image.asset('assets/image/logo.png'),
                trueValue: Image.asset('assets/image/logo2.png')),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('_count = $_count'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('if _count % 2 == 1,  update image !'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.threesixty),
            onPressed: onTapText,
          )
        ],
      ),
    );
  }
}
