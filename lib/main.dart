import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingview_app/app.dart';
import 'package:tradingview_app/cubit_observer.dart';

void main() {
  Bloc.observer = CubitObserver();
  runApp(const MyApp());
}
