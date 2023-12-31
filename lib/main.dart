import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_assessment/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Post App',
      home: SafeArea(child: Home()),
    );
  }
}
