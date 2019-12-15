import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class RandomBLoC {
  StreamController<String> _Controller;
  Random _random;

  RandomBLoC() {
    _Controller = StreamController();
    _random = Random();
  }

  Stream<String> get stream => _Controller.stream;

  randomMenu(BuildContext context) async {
    var metadata = [
      "麻辣烫",
      "汤饭",
      "猪脚饭",
      "米线",
      "芝士焗饭",
      "拌面",
      "酸菜鱼",
      "肠粉",
      "黄焖鸡",
      "鸡煲",
      "麻辣香锅",
      "披萨",
      "麦当劳",
      "肯德基",
      "炒饭",
      "牛肉面",
      "方便面",
      "水煮鱼",
      "炸鸡",
      "烤鸭",
      "咖喱饭",
      "寿司",
      "云吞面",
      "烧烤"
    ];
    for (int i = 0; i < 20; i++) {
      await Future.delayed(new Duration(milliseconds: 25), () {
        return "${metadata.length == 0 ? "暂无可用" : metadata[_random.nextInt(metadata.length)]}";
      }).then((s) {
        _Controller.sink.add(s);
      });
    }
  }

  dispose() {
    _Controller.close();
  }
}
