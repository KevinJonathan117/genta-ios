import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:genta_ios/home.dart';
import 'package:genta_ios/styles.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(CupertinoApp(
      debugShowCheckedModeBanner: false,
      color: Styles.appBackground,
      home: HomeScreen()));
}
