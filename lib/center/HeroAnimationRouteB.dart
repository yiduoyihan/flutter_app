import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      child: Hero(
        tag: "headpic", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.network(
            "https://pics6.baidu.com/feed/a08b87d6277f9e2f798cf7c45d6c9123b999f321.jpeg?token=3f62318e5b2e333576bd8a11a7ed731f"),
      ),
      onTap: () {
        //点击关闭当前页面
        Navigator.pop(context);
      },
    ));
  }
}
