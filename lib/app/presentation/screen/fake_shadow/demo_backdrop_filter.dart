import 'dart:ui';

import 'package:app_demo/app/presentation/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DemoBackdropFilterScreen extends StatefulWidget {
  const DemoBackdropFilterScreen({Key? key}) : super(key: key);

  @override
  State<DemoBackdropFilterScreen> createState() =>
      _DemoBackdropFilterScreenState();
}

class _DemoBackdropFilterScreenState extends State<DemoBackdropFilterScreen> {
  final _iconSize = 30.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backdrop filter'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 24,),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1, left: 1),
                  child: SizedBox(
                    height: _iconSize,
                    width: _iconSize,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                          sigmaY: 1, sigmaX: 1, tileMode: TileMode.decal),
                      child: SvgPicture.asset(
                        'assets/svgs/sc_ic_heart_fill.svg',
                        height: _iconSize,
                        width: _iconSize,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/svgs/sc_ic_heart_fill.svg',
                  height: _iconSize,
                  width: _iconSize,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
