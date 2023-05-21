import 'dart:math';

import 'package:flutter/material.dart';
import 'package:padc_animations/assignment/explicit_animation_description_title_view.dart';
import 'package:padc_animations/assignment/explicit_animations_detal_favourite.dart';
import 'package:padc_animations/explicit_animations_favourite.dart';
import 'package:padc_animations/implicit_animations.dart';

import 'app_constants.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isCollapse = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Column(
            children: [
              const UpperLayoutSectionView(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    const Text("OUTFIT IDEAS"),
                    const Text(
                      "Modern Blue Jacket",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "\$1,939",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 24),
                    ExplicitAnimationDescriptionTitleView(isCollapse, () {
                      setState(() {
                        isCollapse = !isCollapse;
                      });
                    }),
                    DescriptionTextView(isCollapse),
                    const SizedBox(height: 32),
                    Row(
                      children: const [
                        Text(
                          "Size your size",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "Size Guide",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizeButtonView("S"),
                        const SizeButtonView("M"),
                        const SizeButtonView("L"),
                        const SizeButtonView("XL"),
                        const SizeButtonView("XXL")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionTextView extends StatelessWidget {
  final bool isCollapse;

  const DescriptionTextView(
    this.isCollapse, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: kAnimationDuration,
      child: Container(
        height: isCollapse ? 0 : null,
        child: const Text(
          ABOUT_FASHION,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class SizeButtonView extends StatefulWidget {
  final String text;

  const SizeButtonView(
    this.text, {
    super.key,
  });

  @override
  State<SizeButtonView> createState() => _SizeButtonViewState();
}

class _SizeButtonViewState extends State<SizeButtonView> {
  bool isBackgroundColorChanged = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBackgroundColorChanged = !isBackgroundColorChanged;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: kAnimationDuration,
            color: isBackgroundColorChanged ? Colors.deepPurple : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Text(
                widget.text,
                style: TextStyle(
                    color:
                        isBackgroundColorChanged ? Colors.white : Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpperLayoutSectionView extends StatelessWidget {
  const UpperLayoutSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      color: Colors.deepPurple,
      child: Stack(
        children: [
          Align(
            child: Image.network(
              PORTRAIT_PHOTO,
              height: 250,
              width: 200,
              fit: BoxFit.cover,
            ),
            alignment: Alignment.center,
          ),
          Row(
            children: [
              const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 28,
              ),
              const Spacer(),
              ExplicitAnimationsDetailFavourite(),
              const SizedBox(width: 8),
              const Icon(
                Icons.share_outlined,
                color: Colors.white,
                size: 28,
              ),
            ],
          )
        ],
      ),
    );
  }
}
