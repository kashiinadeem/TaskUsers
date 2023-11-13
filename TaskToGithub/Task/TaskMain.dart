import 'package:crickon/Controllers/LocationController.dart';
import 'package:crickon/Controllers/ModesController.dart';
import 'package:crickon/Controllers/ThemeController.dart';
import 'package:crickon/Task/Presentation/DispalayTaskWithStreamBuilder.dart';
import 'package:crickon/Themes/DarkTheme.dart';
import 'package:crickon/Themes/LightTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Loader());
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: TaskWithStreamBuilder(),
    );
  }
}
