import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WindowUtils {
  static const MethodChannel _channel = const MethodChannel('window_utils');

  static Future showTitleBar() {
    return _channel.invokeMethod<bool>('showTitleBar');
  }

  static Future<bool> hideTitleBar() {
    return _channel.invokeMethod<bool>('hideTitleBar');
  }

  static Future<bool> closeWindow() {
    return _channel.invokeMethod<bool>('closeWindow');
  }

  static Future<bool> minWindow() {
    return _channel.invokeMethod<bool>('minWindow');
  }

  static Future<bool> maxWindow() {
    return _channel.invokeMethod<bool>('maxWindow');
  }

  static Future<bool> centerWindow() {
    return _channel.invokeMethod<bool>('centerWindow');
  }

  static Future<bool> setPosition(Offset offset) {
    return _channel.invokeMethod<bool>('setPosition', {
      "x": offset.dx,
      "y": offset.dy,
    });
  }

  static Future<bool> setSize(Size size) {
    return _channel.invokeMethod<bool>('setSize', {
      "width": size.width,
      "height": size.height,
    });
  }

  static Future<bool> startDrag() {
    return _channel.invokeMethod<bool>('startDrag');
  }

  /// [Windows] Only
  static Future<bool> startResize(DragPosition position) {
    return _channel.invokeMethod<bool>(
      'startResize',
      {
        "top": position == DragPosition.top ||
            position == DragPosition.topLeft ||
            position == DragPosition.topRight,
        "bottom": position == DragPosition.bottom ||
            position == DragPosition.bottomLeft ||
            position == DragPosition.bottomRight,
        "right": position == DragPosition.right ||
            position == DragPosition.topRight ||
            position == DragPosition.bottomRight,
        "left": position == DragPosition.left ||
            position == DragPosition.topLeft ||
            position == DragPosition.bottomLeft,
      },
    );
  }

  static Future<bool> windowTitleDoubleTap() {
    return _channel.invokeMethod<bool>('windowTitleDoubleTap');
  }

  /// [MacOS] Only
  static Future<int> childWindowsCount() {
    return _channel.invokeMethod<int>('childWindowsCount');
  }

  /// Size of Screen that the current window is inside
  static Future<Size> getScreenSize() async {
    final _data = await _channel.invokeMethod<Map>('getScreenSize');
    return Size(_data['width'] as double, _data['height'] as double);
  }

  static Future<Size> getWindowSize() async {
    final _data = await _channel.invokeMethod<Map>('getWindowSize');
    return Size(_data['width'] as double, _data['height'] as double);
  }

  static Future<Offset> getWindowOffset() async {
    final _data = await _channel.invokeMethod<Map>('getWindowOffset');
    return Offset(_data['offsetX'] as double, _data['offsetY'] as double);
  }
}

enum DragPosition {
  top,
  left,
  right,
  bottom,
  topLeft,
  bottomLeft,
  topRight,
  bottomRight
}
