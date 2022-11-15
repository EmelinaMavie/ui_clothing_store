import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, welcome 👋',
                      style: kEncodSansRegular.copyWith(
                        color: kDarkBrown,
                        // 14
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      'Lucy Precious',
                      style: kEncodSansBold.copyWith(
                        color: kDarkBrown,
                        // 14
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/3199969/pexels-photo-3199969.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kEncodSansRegular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(color: kDarkGrey),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search clothes',
                      hintStyle: kEncodSansRegular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 49,
                  width: 49,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kYellow,
                  ),
                  child: SvgPicture.asset('assets/filter_icon.svg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // SizedBox(
          //     width: double.infinity,
          //     height: 36,
          //     child: ListView.builder(
          //       physics: const BouncingScrollPhysics(),
          //       itemBuilder: (context, index) {
          //         return GestureDetector();
          //       },
          //     )),
        ],
      ),
    );
  }
}
