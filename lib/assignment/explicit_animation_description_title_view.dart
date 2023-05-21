import 'dart:math';

import 'package:flutter/material.dart';

import '../implicit_animations.dart';

class ExplicitAnimationDescriptionTitleView extends StatefulWidget {
  final bool isCollapse;
  final Function onTapCollapse;

  ExplicitAnimationDescriptionTitleView(this.isCollapse, this.onTapCollapse);

  @override
  State<ExplicitAnimationDescriptionTitleView> createState() =>
      _ExplicitAnimationDescriptionTitleViewState();
}

class _ExplicitAnimationDescriptionTitleViewState
    extends State<ExplicitAnimationDescriptionTitleView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
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
    _rotateAnimation =
        Tween<double>(begin: 0, end: 180).animate(_controller.view);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Descriptions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        AnimatedBuilder(
          animation: _controller.view,
          builder: (context, child) => IconButton(
              onPressed: () {
                widget.onTapCollapse();
                //
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              icon: Transform.rotate(
                angle: degreesToRadians(_rotateAnimation.value),
                child: const Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 32,
                ),
              )),
        )
      ],
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
