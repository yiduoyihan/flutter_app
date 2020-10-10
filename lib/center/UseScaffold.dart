import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UseScaffold extends StatefulWidget {
  @override
  _UseScaffold createState() => _UseScaffold();
}
// MultiTickerProviderStateMixin
class _UseScaffold extends State<UseScaffold>
    with  TickerProviderStateMixin{

  int _selectIndex = 1;

  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("主页框架的搭建"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              showAboutDialog(context: context, children: [Text("分享")]);
            },
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      drawer: Drawer(),
      body: TabBarView(
        controller:  _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "添加内容",
        child: Icon(Icons.add),
        onPressed: () => print("点击了加好"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("商业")),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("学校")),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
