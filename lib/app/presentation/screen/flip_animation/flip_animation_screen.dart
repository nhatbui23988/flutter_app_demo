import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimationScreen extends StatefulWidget {
  const FlipAnimationScreen({Key? key}) : super(key: key);

  @override
  State<FlipAnimationScreen> createState() => _FlipAnimationScreenState();
}

class _FlipAnimationScreenState extends State<FlipAnimationScreen> {
  bool _showFrontSide = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 200,
        height: 200,
        child: _buildFlipAnimation(),
      ),
    ));
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: (){
        setState(() =>_showFrontSide = !_showFrontSide);
      },
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widgetBuilder, list) => Stack(
          alignment: Alignment.center,
            children: [if (widgetBuilder != null) widgetBuilder, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __buildLayout({Key? key, String? faceName, Color? backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(faceName?.substring(0, 1) ?? '',
            style: TextStyle(fontSize: 80.0)),
      ),
    );
  }

  Widget __transitionBuilder(Widget subWidget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: subWidget,
      builder: (context, widgetBuilder) {
        final isUnder = (ValueKey(_showFrontSide) != widgetBuilder?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationX(value)..setEntry(3, 0, tilt),
          child: widgetBuilder,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: "Buy",
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.blue,
      faceName: "100.000d",
    );
  }
}
