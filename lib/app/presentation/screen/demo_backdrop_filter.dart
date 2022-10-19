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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backdrop filter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                'assets/images/september_by_alartriss_df7w6y0-fullview.jpeg'),
            CustomIconWidget(),
            Image.asset(
                'assets/images/september_by_alartriss_df7w6y0-fullview.jpeg'),
          ],
        ),
      ),
    );
  }
}
