import 'package:flutter/material.dart';
import 'package:sriway/route/route_constants.dart';
import 'package:sriway/route/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sriway',
      onGenerateRoute: router.generateRoute,
      initialRoute: splashScreenRoute,
    );
  }
}
