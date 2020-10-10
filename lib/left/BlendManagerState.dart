import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlendManagerState extends StatefulWidget {
  @override
  _BlendManagerState createState() => new _BlendManagerState();
}

class _BlendManagerState extends State<BlendManagerState> {

  bool _active = false;

  void _handerOnTap(bool newValue) {
    print(newValue);
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text("混合管理状态")
        ),
        body: new Container(
            child: new TabBox(
              active: _active,
              onChanged: _handerOnTap,
            )
        )
    );
  }
}

class TabBox extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TabBox({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  // void _handleTap() {
  //   onChanged(!active);
  // }

  @override
  _TabBox createState() => new _TabBox();

}

class _TabBox extends State<TabBox> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? "Active" : "Inactive",
            style: new TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight ? new Border.all(
                color: Colors.teal[700], width: 10) : null
        ),
      ),
    );
  }


}