import 'package:flutter/material.dart';
import 'center/MixScrollView.dart';
import 'center/ScrollListener.dart';
import 'center/TestStaggeredGridView.dart';
import 'center/UseConstrainedBox.dart';
import 'center/UseGridViewWidget.dart';
import 'center/UseListViewWidget.dart';
import 'center/UsePadding.dart';
import 'center/UseRealGridViewWidget.dart';
import 'center/UseRealListViewWidget.dart';
import 'center/UseScaffold.dart';
import 'center/UseScrollWidget.dart';
import 'left/AlignLayout.dart';
import 'left/BlendManagerState.dart';
import 'left/ButtonStyleTest.dart';
import 'left/CheckBox.dart';
import 'left/Counter.dart';
import 'left/EditText.dart';
import 'left/FlexLayout.dart';
import 'left/LinearLayout.dart';
import 'left/ParentManagerState.dart';
import 'left/PicAndIcon.dart';
import 'left/ProgressBar.dart';
import 'left/SelfManagerState.dart';
import 'left/StackLayout.dart';
import 'left/TextFontStyle.dart';
import 'left/WrapFlowLayout.dart';

///程序入口

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      //注册路由表
      routes: {
        "/": (context) => MyHomePage(),
        //首页路由
        "new_counter_page____": (context) => Counter(),
        //计数器页面
        "self_manager_state__": (context) => SelfManagerState(),
        //自管理状态页面
        "parent_manager_state": (context) => ParentManagerState(),
        //父管理状态页面
        "blend_manager_state_": (context) => BlendManagerState(),
        //混合管理状态页面
        "text_font_style_____": (context) => TextFontStyle(),
        //文本字体样式
        "button_style________": (context) => ButtonStyleTest(),
        //按钮
        "picture_and_icon____": (context) => PicAndIcon(),
        //图片和icon
        "switch_and_checkbox_": (context) => CheckBox(),
        //单选和复选框
        "edit_text_input_____": (context) => EditText(),
        //输入框
        "progressbar_________": (context) => ProgressBar(),
        //进度条
        "linear_layout_in_app": (context) => LinearLayout(),
        //线性布局
        "flex_layout_in_app__": (context) => FlexLayout(),
        //弹性布局
        "wrap_and_flow_in_app": (context) => WrapFlowLayout(),
        //流式布局
        "stack_and_positioned": (context) => StackLayout(),
        //层叠布局
        "align_and_relative__": (context) => AlignLayout(),
        //对齐与相对定位
        "padding_in_layout___": (context) => UsePadding(),
        //对padding的使用
        "constrained_box_use_": (context) => UseConstrainedBox(),
        //ConstrainedBox
        "scaffold_in_flutter_": (context) => UseScaffold(),
        //脚手架使用
        "scroll_widget_use___": (context) => UseScrollWidget(),
        //滚动组件
        "listview_attributes_": (context) => UseListViewWidget(),
        //ListView
        "listview_attributes_1": (context) => UseRealListViewWidget(),
        //模拟真实分页加载的ListView
        "gridview_attributes_": (context) => UseGridViewWidget(),
        //GridView
        "gridview_attributes_1": (context) => UseRealGridViewWidget(),
        //模拟真实分页加载的GridView
        "gridview_staggerrd__": (context) => TestStaggeredGridView(),
        //瀑布流gridview
        "mix_scroll_view_test": (context) => MixScrollView(),
        //混合布局（ListView + GridView）
        "scroll_listener_test": (context) => ScrollListener(),
        //滚动监听
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Flutter实战book练习"),
      ),
      body: new Container(
        //有一行，一行里面有3列。
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumnLeft(context),
            buildButtonColumnCenter(context),
            // buildButtonColumn(context),
          ],
        ),
      ),
    );
  }

  buildButtonColumnLeft(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
            child: Text("计数器"),
            onPressed: () => startActivity(context, "new_counter_page____")),
        RaisedButton(
            child: Text("自管理状态"),
            onPressed: () => startActivity(context, "self_manager_state__")),
        RaisedButton(
            child: Text("父管理状态"),
            onPressed: () => startActivity(context, "parent_manager_state")),
        RaisedButton(
            child: Text("混合管理状态"),
            onPressed: () => startActivity(context, "blend_manager_state_")),
        RaisedButton(
            child: Text("文本字体样式"),
            onPressed: () => startActivity(context, "text_font_style_____")),
        RaisedButton(
            child: Text("按钮样式"),
            onPressed: () => startActivity(context, "button_style________")),
        RaisedButton(
            child: Text("图片和icon"),
            onPressed: () => startActivity(context, "picture_and_icon____")),
        RaisedButton(
            child: Text("单选和复选"),
            onPressed: () => startActivity(context, "switch_and_checkbox_")),
        RaisedButton(
            child: Text("输入框和表单"),
            onPressed: () => startActivity(context, "edit_text_input_____")),
        RaisedButton(
            child: Text("进度指示器"),
            onPressed: () => startActivity(context, "progressbar_________")),
        RaisedButton(
            child: Text("线性布局体现"),
            onPressed: () => startActivity(context, "linear_layout_in_app")),
        RaisedButton(
            child: Text("弹性布局"),
            onPressed: () => startActivity(context, "flex_layout_in_app__")),
        RaisedButton(
            child: Text("流式布局"),
            onPressed: () => startActivity(context, "wrap_and_flow_in_app")),
        RaisedButton(
            child: Text("层叠布局"),
            onPressed: () => startActivity(context, "stack_and_positioned")),
        RaisedButton(
            child: Text("对齐与相对定位"),
            onPressed: () => startActivity(context, "align_and_relative__")),
      ],
    );
  }

  buildButtonColumnCenter(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("padding"),
          onPressed: () => startActivity(context, "padding_in_layout___"),
        ),
        RaisedButton(
          child: Text("约束盒"),
          onPressed: () => startActivity(context, "constrained_box_use_"),
        ),
        RaisedButton(
          child: Text("脚手架的使用"),
          onPressed: () => startActivity(context, "scaffold_in_flutter_"),
        ),
        RaisedButton(
          child: Text("可滚动组件"),
          onPressed: () => startActivity(context, "scroll_widget_use___"),
        ),
        RaisedButton(
          child: Text("ListView"),
          onPressed: () => startActivity(context, "listview_attributes_"),
        ),
        RaisedButton(
          child: Text("真实listview加载"),
          onPressed: () => startActivity(context, "listview_attributes_1"),
        ),
        RaisedButton(
          child: Text("GridView"),
          onPressed: () => startActivity(context, "gridview_attributes_"),
        ),
        RaisedButton(
          child: Text("模拟真实GridView"),
          onPressed: () => startActivity(context, "gridview_attributes_1"),
        ),
        RaisedButton(
          child: Text("瀑布流GridView"),
          onPressed: () => startActivity(context, "gridview_staggerrd__"),
        ),
        RaisedButton(
          child: Text("混合的滑动列表"),
          onPressed: () => startActivity(context, "mix_scroll_view_test"),
        ),
        RaisedButton(
          child: Text("滚动监听"),
          onPressed: () => startActivity(context, "scroll_listener_test"),
        ),
        WillPopScope(
            child: Container(
              alignment: Alignment.center,
              child: Text("再按一下退出"),
            ),
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) >
                      Duration(seconds: 2)) {
                _lastPressedAt = DateTime.now();
                return false;
              }
              return true;
            })
      ],
    );
  }
}

startActivity(BuildContext context, String string) {
  Navigator.pushNamed(context, string);
}
