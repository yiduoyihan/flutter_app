import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UseRealGridViewWidget extends StatefulWidget {
  @override
  _UseRealGridViewWidget createState() => _UseRealGridViewWidget();
}

class _UseRealGridViewWidget extends State<UseRealGridViewWidget> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("模拟异步加载Gridview"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            if (index == _icons.length - 1 && _icons.length < 100) {
              _requestData();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  void _requestData() {
    Future.delayed(Duration(milliseconds: 1500)).then((value) => setState(() {
          _icons.addAll([
            Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access,
            Icons.cake,
            Icons.free_breakfast
          ]);
        }));
  }
}
