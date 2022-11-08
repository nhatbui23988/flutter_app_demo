import 'package:app_demo/app/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'rive_animation/demo_rive_animation.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

   GlobalKey animationKey = GlobalKey<PlayOneShotAnimationState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonNavigate(context, 'Backdrop Filter', AppRoutes.audioPlayer),
            _buildButtonNavigate(context, 'Preview Url', AppRoutes.previewUrl),
            _buildButtonNavigate(context, 'Flip Animation', AppRoutes.flipAnimation),
            _buildButtonNavigate(context, 'State demo', AppRoutes.stateDemo),
            // _buildButtonNavigate(context, 'Multi List Animation', AppRoutes.riveMultiAnimations),
            // _buildButtonNavigate(context, 'Animated List', AppRoutes.animatedList),
            // _buildButtonNavigate(context, 'Rive one shot animation', AppRoutes.riveOneShotAnimation),
            // _buildButtonNavigate(context, 'Rive one shot animation TWO', AppRoutes.riveOneShotAnimationTwo),
            // _buildButtonNavigate(context, 'Rive play pause animation', AppRoutes.rivePlayPauseAnimation),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonNavigate(
      BuildContext context, String pageName, String pagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: OutlinedButton(
          onPressed: () async {
            Navigator.of(context).pushNamed(pagePath, arguments: animationKey);
            // await Future.delayed(const Duration(seconds: 1),() {
            //   (animationKey.currentState as PlayOneShotAnimationState?)?.onReact();
            // });
          },
          child: Text(pageName)),
    );
  }
}
