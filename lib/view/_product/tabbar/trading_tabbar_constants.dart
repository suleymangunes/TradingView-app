import 'package:flutter/material.dart';
import 'package:tradingview_app/product/init/locale/project_keys.dart';

class TabbarConstants {
  static final TabbarConstants _tabbarConstants = TabbarConstants._internal();

  factory TabbarConstants() {
    return _tabbarConstants;
  }

  TabbarConstants._internal();

  static const tabbarItems = [
    Text(ProjectKeys.trend),
    Text(ProjectKeys.technicals),
    Text(ProjectKeys.transaction),
  ];
}
