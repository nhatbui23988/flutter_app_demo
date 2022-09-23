/// Demonstrates playing a one-shot animation on demand
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class PlayOneShotAnimation extends StatefulWidget {
   const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  PlayOneShotAnimationState createState() => PlayOneShotAnimationState();
}

class PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  /// Controller for playback
  Artboard? _playButtonArtboard;
  SMIInput<bool>? _playButtonInput;
  /// Is the animation currently playing?
  bool isPlaying = false;

  bool isReaction = false;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animation/match_deck_new.riv').then(
          (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.animations.forEach((element) {
          print('#####################');
          print('#stateMachines name ${element.name}');
          print('##stateMachines inputs ${element.artboard}');
        });
        artboard.stateMachines.forEach((element) {
          print('#####################');
          print('#stateMachines name ${element.name}');
          print('##stateMachines inputs ${element.inputs.values.first.name}');
        });
        var controller = StateMachineController.fromArtboard(
          artboard,
          'Un-react',
            onStateChange: (oldState, newState){
            print('oldState $oldState');
            print('newState $newState');
            }
        );
        if (controller != null) {
          artboard.addController(controller);
          _playButtonInput = controller.findInput('Tap');
          _playButtonInput?.value = false;
        }
        setState(() => _playButtonArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      backgroundColor: Colors.amber,
      body: SizedBox.expand(
        child: Column(
          children: [
            Text('Reaction $isReaction'),
            Container(
              color: Colors.white,
              child: _playButtonArtboard == null ? const SizedBox.shrink() : Center(
                child: GestureDetector(
                  onTapDown: (_) {
                    _playPauseButtonAnimation();
                  },
                  child: SizedBox(
                    height: 125,
                    width: 125,
                    child: Rive(
                      artboard: _playButtonArtboard!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }

  void _playPauseButtonAnimation() {
    if (_playButtonInput?.value == false &&
        _playButtonInput?.controller.isActive == false) {
      _playButtonInput?.value = true;
    } else if (_playButtonInput?.value == true &&
        _playButtonInput?.controller.isActive == false) {
      _playButtonInput?.value = false;
    }
  }
}

