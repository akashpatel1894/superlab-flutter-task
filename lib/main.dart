import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sephora_flutter/route/route.dart';
import 'package:sephora_flutter/service/service_locator.dart';

Future<void> main() async {
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sephora',
      theme: ThemeData(useMaterial3: true),
      initialRoute: RouteClass.splash,
      getPages: RouteClass.routes,
    );
  }
}

