import 'package:app_demo/app/presentation/screen/demo_animated_list.dart';
import 'package:app_demo/app/presentation/screen/demo_audio_player.dart';
import 'package:app_demo/app/presentation/screen/rive_animation/demo_rive_animation.dart';
import 'package:app_demo/app/presentation/screen/rive_animation/demo_rive_animation_two.dart';
import 'package:app_demo/app/presentation/screen/rive_animation/demo_rive_multi_animation.dart';
import 'package:app_demo/app/presentation/screen/rive_animation/play_pause_animation.dart';
import 'package:app_demo/app/presentation/screen/state_demo/state_demo_screen.dart';
import 'package:app_demo/app/presentation/screen/unknown_screen.dart';
import 'package:app_demo/app/presentation/screen/video_trimmer/demo_video_trimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String audioPlayer = '/audio-player';
  static const String animatedList = '/animated-list';
  static const String riveOneShotAnimation = '/rive-one-shot-animation';
  static const String riveOneShotAnimationTwo = '/rive-animation-two';
  static const String riveMultiAnimations = '/multi-animations';
  static const String rivePlayPauseAnimation = '/rive-play-pause-animation';
  static const String stateDemo = '/state-demo';
  static const String videoTrimmerDemo = '/video-trimmer';

  static PageRoute onGenerateRoute(RouteSettings routeSettings) {
    String routeName = routeSettings.name ?? '/unknown';
    Uri uri = Uri.parse(routeName);
    String path = uri.path;
    if (path.contains(audioPlayer)) {
      return MaterialPageRoute(
          builder: (_) => DemoAudioPlayer(title: 'Audio Player'));
    }

    if (path.contains(animatedList)) {
      return MaterialPageRoute(builder: (_) => const AnimatedListSample());
    }
    if (path.contains(riveOneShotAnimation)) {
      return MaterialPageRoute(builder: (_) => PlayOneShotAnimation());
    }
    if (path.contains(riveOneShotAnimationTwo)) {
      return MaterialPageRoute(builder: (_) => PlayOneShotAnimationTwo());
    }

    if (path.contains(rivePlayPauseAnimation)) {
      return MaterialPageRoute(builder: (_) => const PlayPauseAnimation());
    } if (path.contains(stateDemo)) {
      return MaterialPageRoute(builder: (_) => const StateDemo());
    }

    if (path.contains(videoTrimmerDemo)) {
      return MaterialPageRoute(builder: (_) => DemoVideoTrimmer());
    }
    if (path.contains(riveMultiAnimations)) {
      return MaterialPageRoute(builder: (_) => MultiAnimationsWidget());
    }

    return MaterialPageRoute(builder: (_) => const UnknownScreen());
  }
}
