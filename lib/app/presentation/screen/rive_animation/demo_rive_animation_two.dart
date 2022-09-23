/// Demonstrates playing a one-shot animation on demand
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class PlayOneShotAnimationTwo extends StatefulWidget {
   const PlayOneShotAnimationTwo({Key? key}) : super(key: key);

  @override
  PlayOneShotAnimationTwoState createState() => PlayOneShotAnimationTwoState();
}

class PlayOneShotAnimationTwoState extends State<PlayOneShotAnimationTwo> {
  /// Controller for playback
  Artboard? _playButtonArtboard;
  SMIInput<bool>? _playButtonInput;
  /// Is the animation currently playing?
  bool isPlaying = false;

  bool isReaction = false;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animation/user_recieve_reaction.riv').then(
          (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        for (var element in artboard.stateMachines) {
          print('#####################');
          print('#stateMachines name ${element.name}');
          print('##stateMachines inputs ${element.inputs.values.first.name}');
        }
        var controller = StateMachineController.fromArtboard(
          artboard,
          'Un-React',
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
        title: const Text('One-Shot TWO'),
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
    if(_playButtonInput?.controller.isActive == false){
      _playButtonInput?.value = !(_playButtonInput?.value ?? false);
    }
  }
}

