import 'package:flutter/material.dart';
import 'package:padc_animations/explicit_animations_favourite.dart';

const kAnimationDuration = Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = Duration(milliseconds: 1500);

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isDescriptionShown = true;
  bool isChangeBackgroundColor = false;
  bool isChangeButtonLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kAnimationDuration,
        color: isChangeBackgroundColor ? Colors.black : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: kAnimationDurationForScreenFadeIn,
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, top: value * 64),
                  child: child,
                ),
              ),
              child: Text(
                "PADC Animations",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isChangeBackgroundColor ? Colors.white : Colors.black,
                ),
              ),
            ),
            Expanded(
              child: TweenAnimationBuilder(
                duration: kAnimationDurationForScreenFadeIn,
                tween: Tween<double>(begin: 0, end: 1),
                child: SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            FlutterLogo(
                              size: isNewDimensions ? 400 : 250,
                            ),
                            const Positioned(
                                right: 0,
                                top: 24,
                                child: ExplicitAnimationsFavourite())
                          ],
                        ),

                        //
                        AnimatedSize(
                          duration: kAnimationDuration,
                          child: SizedBox(
                            height: isDescriptionShown ? null : 0.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              child: Text(
                                "For developers, Flutter lowers the bar to entry for building apps. It speeds app development and reduces the cost and complexity of app production across platforms."
                                "For designers, Flutter provides a canvas for high-end user experiences.The compromises imposed by typical frameworks. It also acts as a productive prototyping tool, with CodePen support for sharing your ideas with others.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: isChangeBackgroundColor
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),

                        // Change button layout
                        AnimatedSize(
                          duration: kAnimationDuration,
                          child: AnimatedSwitcher(
                            duration: kAnimationDuration,
                            child: isChangeButtonLayout
                                ? PrimaryButtonInWrap(onTapChangeDimension: () {
                                    setState(() {
                                      isNewDimensions = !isNewDimensions;
                                    });
                                  }, onTapHideOrShowDescription: () {
                                    setState(() {
                                      isDescriptionShown = !isDescriptionShown;
                                    });
                                  }, onTapChangeTheme: () {
                                    setState(() {
                                      isChangeBackgroundColor =
                                          !isChangeBackgroundColor;
                                    });
                                  })
                                : PrimaryButtonInColumn(
                                    onTapChangeDimension: () {
                                    setState(() {
                                      isNewDimensions = !isNewDimensions;
                                    });
                                  }, onTapHideOrShowDescription: () {
                                    setState(() {
                                      isDescriptionShown = !isDescriptionShown;
                                    });
                                  }, onTapChangeTheme: () {
                                    setState(() {
                                      isChangeBackgroundColor =
                                          !isChangeBackgroundColor;
                                    });
                                  }),
                          ),
                        ),

                        const SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isChangeButtonLayout = !isChangeButtonLayout;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text("Change Button Layout"))
                      ],
                    ),
                  ),
                ),
                builder: (context, value, child) => Opacity(
                  opacity: value,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButtonInColumn extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapHideOrShowDescription;
  final Function onTapChangeTheme;

  const PrimaryButtonInColumn(
      {required this.onTapChangeDimension,
      required this.onTapHideOrShowDescription,
      required this.onTapChangeTheme,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () {
              onTapChangeDimension();
            },
            child: const Text("Change Dimensions")),
        ElevatedButton(
            onPressed: () {
              onTapHideOrShowDescription();
            },
            child: const Text("Show Description")),
        ElevatedButton(
            onPressed: () {
              onTapChangeTheme();
            },
            child: const Text("Change Theme"))
      ],
    );
  }
}

class PrimaryButtonInWrap extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapHideOrShowDescription;
  final Function onTapChangeTheme;

  const PrimaryButtonInWrap(
      {required this.onTapChangeDimension,
      required this.onTapHideOrShowDescription,
      required this.onTapChangeTheme,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 16,
      children: [
        ElevatedButton(
            onPressed: () {
              onTapChangeDimension();
            },
            child: const Text("Change Dimensions")),
        ElevatedButton(
            onPressed: () {
              onTapHideOrShowDescription();
            },
            child: const Text("Show Description")),
        ElevatedButton(
            onPressed: () {
              onTapChangeTheme();
            },
            child: const Text("Change Theme"))
      ],
    );
  }
}
