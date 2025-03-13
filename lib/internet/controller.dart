import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  String? _lastRoute; // Stores the last active route before internet loss

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      netStatus(results);
    });
  }

  void netStatus(List<ConnectivityResult> results) {
    if (results.isEmpty) return;

    bool isConnected = results.any((cr) => cr != ConnectivityResult.none);

    if (!isConnected) {
      if (Get.currentRoute != '/no-internet') {
        _lastRoute = Get.currentRoute; // Save the last active route
        Get.offNamed('/no-internet');
      }
    } else {
      if (Get.currentRoute == '/no-internet') {
        if (_lastRoute != null && _lastRoute != '/no-internet') {
          Get.offAllNamed(_lastRoute!); // Return to the last active route
        } else {
          Get.offAllNamed('/'); // Fallback to home page if last route is null
        }
      }
    }
  }
}
