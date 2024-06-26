import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:twitter_flutter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('token');

  runApp(const MyApp());
}
