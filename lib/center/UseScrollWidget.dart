import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///当组件内容超过当前显示视口(ViewPort)时，如果没有特殊处理，Flutter则会提示Overflow错误
///Flutter提供了多种可滚动组件（Scrollable Widget）用于显示列表和长布局.
///可滚动组件都直接或间接包含一个Scrollable组件，因此它们包括一些共同的属性.
///
/// Scrollbar是一个Material风格的滚动指示器（滚动条），如果要给可滚动组件添加滚动条，
/// 只需将Scrollbar作为可滚动组件的任意一个父级组件即可
///
/// 通常将滚动方向称为主轴，非滚动方向称为纵轴。
///
/// SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子组件。

class UseScrollWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   return Scaffold(
     appBar: AppBar(
       title: Text("SingleChildScrollView"),
     ),
     body: Scrollbar(
       child: SingleChildScrollView(
         padding: EdgeInsets.all(20),
         child: Center(
           child: Column(
             children:str.split("").map((e) => Text(e,textScaleFactor: 2,)).toList(),
           ),
         ),
       ),
     ),
   );
  }

}