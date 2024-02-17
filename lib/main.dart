import 'package:flutter/material.dart';
import 'package:ilink_task/app.dart';
import 'package:ilink_task/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSL();
  runApp(const PetsTask());
}
