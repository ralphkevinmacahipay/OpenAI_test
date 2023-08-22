import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_ai/home/home.dart';
import 'package:open_ai/statemanagement/get.dart';

void main() {
  Get.put(ChatServicesController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
