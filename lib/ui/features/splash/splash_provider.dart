import 'package:flutter/material.dart';
import 'package:halian/config/router/route_strings.dart';
import '../../../config/router/my_router.dart';
import '../../../config/service_locator.dart';

class SplashProvider extends ChangeNotifier{
  final _router = locator<MyRouter>().router;

  init() {
    Future.delayed(const Duration(seconds: 2),(){
      _router.goNamed(homeView);
    });
  }

}