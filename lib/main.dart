import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 64,
          child: CustomNavigationBar(
            isFloating: true,
            borderRadius: const Radius.circular(40),
            selectedColor: kWhite,
            unSelectedColor: kGrey,
            backgroundColor: kBrown,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 40,
            items: [
              CustomNavigationBarItem(
                icon: _currentIndex == 0
                    ? SvgPicture.asset('assets/home_icon_selected.svg')
                    : SvgPicture.asset('assets/home_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 1
                    ? SvgPicture.asset('assets/cart_icon_selected.svg')
                    : SvgPicture.asset('assets/cart_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 2
                    ? SvgPicture.asset('assets/favorite_icon_selected.svg')
                    : SvgPicture.asset('assets/favorite_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 3
                    ? SvgPicture.asset('assets/account_icon_selected.svg')
                    : SvgPicture.asset('assets/account_icon_unselected.svg'),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
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
  List<String> categories = [
    'All items',
    'Dress',
    'Hat',
    'Watch',
  ];

  List<String> categoryIcons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon',
  ];

  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    // 'image-05',
    // 'image-06',
  ];

  int current = 0;

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
                    color: kBlack,
                  ),
                  child: SvgPicture.asset('assets/filter_icon.svg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: current == index ? kPaddingHorizontal : 15,
                      right: current == categories.length - 1
                          ? kPaddingHorizontal
                          : 0,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? kBrown : kWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(
                              color: kLightGrey,
                              width: 1,
                            ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(current == index
                            ? 'assets/${categoryIcons[index]}_selected.svg'
                            : 'assets/${categoryIcons[index]}_unselected.svg'),
                        const SizedBox(width: 4),
                        Text(
                          categories[index],
                          style: kEncodSansMedium.copyWith(
                            color: current == index ? kWhite : kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: images.length,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.asset(
                            'assets/images/${images[index]}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/favorite_cloth_icon_unselected.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Modern light cloths',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodSansSemibold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    'Dress modern',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodSansRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '212.99 MT',
                        style: kEncodSansSemibold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: kYellow,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '5.0',
                            style: kEncodSansRegular.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
