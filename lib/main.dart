import 'package:flutter/material.dart';
import 'package:weather_api/service/dio.dart';
import 'package:weather_api/src/App_Root.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}

