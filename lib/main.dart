import 'package:earhquake_stock_managment/app.dart';
import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(
    const App(),
  );
}

Future<void> _init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReceiveModelAdapter());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
