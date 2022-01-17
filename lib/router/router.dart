import 'package:flutter/material.dart';
import 'package:gika/router/constants.dart';
import 'package:gika/screen/detail/index.dart';
import 'package:gika/screen/home/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeRoute());
      case detailRoute:
      Map detail = settings.arguments as Map;
        return MaterialPageRoute(
            settings: settings, builder: (_) => DetailRoute(index: detail['index'],));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error Route'),
        ),
        body: const Center(
          child: Text('Page Not Found'),
        ),
      );
    });
  }
}
