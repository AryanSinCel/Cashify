import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to white
        child: Center(
          child: Image.asset("assets/images/error.avif"),
        ),
      ),
    );
  }
}
