import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HeroAnimationRouteB.dart';

class HeroAnimationTest extends StatefulWidget {
  @override
  _HeroAnimationTest createState() => new _HeroAnimationTest();
}

class _HeroAnimationTest extends State<HeroAnimationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "headpic",
            child: ClipOval(
              child: Image.network(
                "https://pics6.baidu.com/feed/a08b87d6277f9e2f798cf7c45d6c9123b999f321.jpeg?token=3f62318e5b2e333576bd8a11a7ed731f",
                width: 100,
              ),
            ),
          ),
          onTap: () {
            //打开新页面
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("原图"),
                  ),
                  body: HeroAnimationRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
