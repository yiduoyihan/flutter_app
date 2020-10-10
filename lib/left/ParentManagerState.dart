import 'package:flutter/material.dart';

class ParentManagerState extends StatefulWidget {
  @override
  _ParentManagerState createState() => new _ParentManagerState();
}

class _ParentManagerState extends State<ParentManagerState> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new TapBox(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ));
  }
}

class TapBox extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBox({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("父管理状态"),
        ),
        body: new GestureDetector(
          onTap: _handleTap,
          child: new Container(
            child: new Center(
              child: new Text(
                active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
          ),
        ));
  }
}
