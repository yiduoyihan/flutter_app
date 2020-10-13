import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///ListView是最常用的可滚动组件之一，它可以沿一个方向线性排布所有子组件，并且它也支持
///基于Sliver的延迟构建模型
///
/// ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候
/// 才会被创建，也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的
///
/// ListView.separated可以在生成的列表项之间添加一个分割组件，它比ListView.builder
/// 多了一个separatorBuilder参数，该参数是一个分割组件生成器。
// ignore: must_be_immutable
class UseListViewWidget extends StatelessWidget {
  Widget divider1 = Divider(color: Colors.red);
  Widget divider2 = Divider(color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView的使用"),
        ),
        body: Column(
          children: <Widget>[
            ListTile(title: Text("数字列表"),),
            Expanded(
                child:
                ListView.separated(
                    itemCount: 100,
                    // itemExtent: 50.0,
                    separatorBuilder: (context, index) {
                      return index % 2 == 0 ? divider1 : divider2;
                    },
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("$index"));
                    }),
            )
          ],
        )
    );
  }
}
