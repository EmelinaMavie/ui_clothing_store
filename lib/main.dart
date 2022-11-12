import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_clothing_store/app_style.dart';
import 'package:ui_clothing_store/size_config.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return SafeArea(
      child: ListView(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text('Hello, wlcome 👋',
                  style: kEncodSansRegular.copyWith(
                    color: kDarkBrown,
                    // 14
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  ),
                ),
                ],
              ),
              // something else on the side 
            ],
          ),
        ],
      ),
    );
  }
}