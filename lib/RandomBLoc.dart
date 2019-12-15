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

  randomGreen(BuildContext context) async {
    var metadata = [
      "黄焖鸡",
      "麻辣香锅",
      "麻辣烫",
      "汉堡王",
      "麦当劳",
      "重庆鸡公煲",
      "出前一丁",
      "肯德基",
      "凉瓜牛肉饭",
      "干炒牛河",
      "扬州炒饭",
      "云吞面",
      "食屎啦你"
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
