import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gika/provider/detail_provider.dart';
import 'package:gika/provider/home_provider.dart';
import 'package:gika/router/constants.dart';
import 'package:provider/provider.dart';
import 'package:gika/router/router.dart' as RouterGen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DetailUserProvider()),
      ],
      child: MaterialApp(
        onGenerateRoute: RouterGen.RouteGenerator.generateRoute,
        initialRoute: homeRoute,
        debugShowCheckedModeBanner: false,
      ),
    ));
  });
}
