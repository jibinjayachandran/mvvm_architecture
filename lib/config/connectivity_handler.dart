import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

bool isOnline = false;

class ConnectivityHandler {
  ConnectivityHandler(BuildContext context) {
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        isOnline = false;
      } else {
        isOnline = true;
      }
    });
  }
}
