import 'package:flutter/material.dart';
import 'package:halian/config/connectivity_handler.dart';
import 'package:halian/config/router/my_router.dart';
import 'package:halian/ui/features/home/providers/home_provider.dart';
import 'package:halian/utilities/constants.dart';

import 'config/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConnectivityHandler(context);
    var router = locator<MyRouter>().router;
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
