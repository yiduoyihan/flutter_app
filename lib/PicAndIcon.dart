import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return new Scaffold(
      appBar: new AppBar(title: new Text("图片和icon")),
      body: Column(
        children: [
          Image(image: AssetImage("assets/images/startimg.jpg"), width: 100.0),
          Image(
            image: NetworkImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
            width: 100.0,
          ),
          Image.asset("assets/images/startimg.jpg", width: 100),
          Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0),
          Text(
            icons,
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green),
          ),
          Icon(Icons.accessible,color: Colors.green,),
          Icon(Icons.error,color: Colors.green,),
          Icon(Icons.fingerprint,color: Colors.green,),
        ],
      ),
    );
  }
}
