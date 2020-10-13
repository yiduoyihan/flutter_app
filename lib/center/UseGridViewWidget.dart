import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UseGridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("纵轴固定数量的GridView"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160, childAspectRatio: 2),
        children: <Widget>[
          Icon(Icons.share),
          Icon(Icons.shop),
          Icon(Icons.movie),
          Icon(Icons.picture_as_pdf),
          Icon(Icons.map),
          Icon(Icons.phone),
        ],
      ),

    );
  }
}
