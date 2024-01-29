// import 'package:doctorapp/widgets/app_drawer.dart';
import 'package:doctor_app/widgets/app_title.dart';
import 'package:doctor_app/pages/base.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(),

      backgroundColor: Colors.grey[200],
      // drawer: const AppDrawer(),
      body: BasePage(),
    );
  }
}
