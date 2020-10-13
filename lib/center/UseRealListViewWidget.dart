import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UseRealListViewWidget extends StatefulWidget {
  @override
  _UseRealListViewWidget createState() => new _UseRealListViewWidget();
}

class _UseRealListViewWidget extends State<UseRealListViewWidget> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("模拟实际加载的ListView"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            //如果到了表尾
            if(_words[index] == loadingTag) {
              //不足100条继续加载
              if (_words.length - 1 < 100) {
                _retrieveData();
                //加载时候显示loading
                return Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: Text("没有更多了", style: TextStyle(color: Colors.red),),
                );
              }
            }
            //显示单词列表
            return ListTile(title: Text(_words[index]),);
          },
          separatorBuilder: (context, index) =>
              Divider(
                height: .0,
              ),
          itemCount: _words.length),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) =>
        setState(() {
          _words.insertAll(_words.length - 1,
              generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
        }));
  }
}
