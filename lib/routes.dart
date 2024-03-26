import 'package:flutter/material.dart';
import 'package:flutter_login_test/src/modules/auth/login_page/login_page.dart';
import 'package:flutter_login_test/src/modules/home/pages/home_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
