import 'package:flutter/material.dart';
import 'package:gbc_landing/home.dart';
import 'package:gbc_landing/widgets/app_scroll_behaviour.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GBC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
