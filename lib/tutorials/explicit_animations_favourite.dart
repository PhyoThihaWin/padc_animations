import 'package:flutter/material.dart';
import 'package:padc_animations/tutorials/implicit_animations.dart';

class ExplicitAnimationsFavourite extends StatefulWidget {
  const ExplicitAnimationsFavourite({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationsFavourite> createState() =>
      _ExplicitAnimationsFavouriteState();
}

class _ExplicitAnimationsFavouriteState
    extends State<ExplicitAnimationsFavourite> with TickerProviderStateMixin {
  /// State
  // bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    /// animation controller
    _controller = AnimationController(
      duration: kAnimationDuration,
      vsync: this,
    );

    /// animation object
    _colorAnimation = ColorTween(begin: Colors.grey[500], end: Colors.red)
        .animate(_controller.view);

    _sizeAnimation =
        Tween<double>(begin: 32, end: 48).animate(_controller.view);

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
        icon: Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: _sizeAnimation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
