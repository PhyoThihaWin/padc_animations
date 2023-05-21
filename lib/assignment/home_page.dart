import 'package:flutter/material.dart';
import 'package:padc_animations/assignment/app_constants.dart';
import 'package:padc_animations/assignment/detail_page.dart';

import '../tutorials/implicit_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkThemeChanged = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      color: isDarkThemeChanged ? Colors.black : Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 100,
            elevation: 0,
            scrolledUnderElevation: 2,
            title: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: kAnimationDuration,
                builder: (context, value, child) => Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, value * 30),
                        child: child,
                      ),
                    ),
                child: Transform.translate(
                  offset: const Offset(0, -30),
                  child: CustomAppBarView(
                      isDarkThemeChanged: isDarkThemeChanged, () {
                    setState(() {
                      isDarkThemeChanged = !isDarkThemeChanged;
                    });
                  }),
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),

                // Trending card section
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: kAnimationDuration,
                    builder: (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(value * 30, 0),
                            child: child,
                          ),
                        ),
                    child: Transform.translate(
                        offset: const Offset(-30, 0),
                        child: HomePurpleCardView(isDarkThemeChanged))),
                const SizedBox(height: 38),

                // Recommended section
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: kAnimationDuration,
                    builder: (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, value * -50),
                            child: child,
                          ),
                        ),
                    child: Transform.translate(
                        offset: const Offset(0, 50),
                        child: RecommendedItemView(isDarkThemeChanged)))
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomerBottomNavigationView(),
      ),
    );
  }
}

class RecommendedItemView extends StatelessWidget {
  final bool isDarkThemeChanged;

  const RecommendedItemView(
    this.isDarkThemeChanged, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrendingTitleView("Recommended", isDarkThemeChanged),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.pink[100]),
                child: Column(
                  children: [
                    Image.network(
                      SHOE_PHOTO,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Shoes",
                      style: TextStyle(color: Colors.pink),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue[100]),
                child: Column(
                  children: [
                    Image.network(
                      SHOE_PHOTO2,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Shoes",
                      style: TextStyle(color: Colors.pink),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CustomerBottomNavigationView extends StatelessWidget {
  const CustomerBottomNavigationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(100)),
      child: const BottomNavigationItemRow(),
    );
  }
}

class BottomNavigationItemRow extends StatelessWidget {
  const BottomNavigationItemRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.home,
          size: 32,
          color: Colors.blue,
        ),
        Icon(
          Icons.search,
          size: 32,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.shopping_basket_outlined,
          size: 32,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.bookmark_outline,
          size: 32,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.circle,
          size: 32,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}

class HomePurpleCardView extends StatelessWidget {
  final bool isDarkThemeChanged;

  const HomePurpleCardView(
    this.isDarkThemeChanged, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrendingTitleView("Trending for you", isDarkThemeChanged),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DetailPage()));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Image.network(
                    PORTRAIT_PHOTO,
                    height: 300,
                  ),
                  right: 40,
                  bottom: 0,
                ),
                Positioned(
                  right: 24,
                  top: 24,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(24)),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, top: 160, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "NEW 2023",
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Modern Outfit\nCollection",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              PROFILE_PHOTO,
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Frina Surapt",
                            style:
                                TextStyle(color: Colors.white54, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TrendingTitleView extends StatelessWidget {
  final String title;
  final bool isDarkThemeChanged;

  TrendingTitleView(this.title, this.isDarkThemeChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isDarkThemeChanged ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.more_horiz,
          color: isDarkThemeChanged ? Colors.white : null,
        )
      ],
    );
  }
}

class CustomAppBarView extends StatelessWidget {
  final Function themeChanged;
  final bool isDarkThemeChanged;

  CustomAppBarView(this.themeChanged, {required this.isDarkThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              PROFILE_PHOTO,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Howdy",
                style: TextStyle(
                  color: isDarkThemeChanged ? Colors.white : Colors.grey,
                  fontSize: 14,
                ),
              ),
              Text(
                "Cristina Yota",
                style: TextStyle(
                    color: isDarkThemeChanged ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              themeChanged();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.red,
                  ),
                  height: 8,
                  width: 8,
                ),
                const Icon(
                  Icons.notifications_none,
                  size: 35,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
