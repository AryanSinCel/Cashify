import 'package:cashify/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'internet/controller.dart';
import 'internet/no_internet_screen.dart';


void main() {
  Get.put(InternetController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const TabView()),
        GetPage(name: '/no-internet', page: () => const NoInternetScreen()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TabView(),
    );
  }
}

