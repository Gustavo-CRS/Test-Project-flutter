import 'package:flutter/material.dart';

import 'routes.dart';

class AppWidget extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        secondaryHeaderColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
