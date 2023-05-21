import 'dart:math';

import 'package:flutter/material.dart';
import 'package:padc_animations/tutorials/implicit_animations.dart';

class ExplicitAnimationsDetailFavourite extends StatefulWidget {
  const ExplicitAnimationsDetailFavourite({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationsDetailFavourite> createState() =>
      _ExplicitAnimationsDetailFavouriteState();
}

class _ExplicitAnimationsDetailFavouriteState
    extends State<ExplicitAnimationsDetailFavourite>
    with TickerProviderStateMixin {
  /// State
  // bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    /// animation controller
    _controller = AnimationController(
      duration: kAnimationDuration,
      vsync: this,
    );

    /// animation object
    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(_controller.view);

    _rotateAnimation =
        Tween<double>(begin: 0, end: 360).animate(_controller.view);

    //
    // _controller.addStatusListener((status) {
    //   isAnimationComplete = status == AnimationStatus.completed;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) => IconButton(
        onPressed: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }

          // _controller.repeat();
        },
        icon: Transform.rotate(
          angle: degreesToRadians(_rotateAnimation.value),
          child: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 32,
          ),
        ),
      ),
    );
  }

  double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
