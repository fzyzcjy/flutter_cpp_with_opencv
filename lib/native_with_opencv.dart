import 'dart:async';

import 'package:flutter/services.dart';

class NativeWithOpencv {
  static const MethodChannel _channel =
      const MethodChannel('native_with_opencv');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
