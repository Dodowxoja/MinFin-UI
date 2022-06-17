import 'package:flutter/material.dart';
import 'package:ui/routes/my_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      theme: ThemeData(),
      onGenerateRoute: MyRoutes.instanse.onGenerate,
      initialRoute: '/my_home_view',
    );
  }
}
