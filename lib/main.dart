import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'main_binding.dart';
import 'model/quiz_model.dart';
import 'model/user_result.dart';
import 'splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(QuizModelAdapter())
    ..registerAdapter(ResultsAdapter())
    ..registerAdapter(UserResultAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        initialBinding: MainBinding(),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
