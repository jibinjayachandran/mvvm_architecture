import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:halian/config/router/route_strings.dart';
import 'package:halian/ui/features/details/details_view.dart';
import '../../ui/features/home/home_view.dart';
import '../../ui/features/splash/splash_view.dart';

class MyRouter{
  late final router = GoRouter(
      initialLocation: '/',
      //debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: splashView,
          path: '/',pageBuilder: (context,state)=>const MaterialPage(child: SplashView(),),),
        GoRoute(
          name: homeView,
          path: '/home',pageBuilder: (context,state)=>const MaterialPage(child: HomeView(),),),
        GoRoute(
          name: detailsView,
          path: '/details',pageBuilder: (context,state)=>const MaterialPage(child: DetailsView(),),),
      ]);
}