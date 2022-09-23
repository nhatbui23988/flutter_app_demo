


/// Demonstrates playing a one-shot animation on demand
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MultiAnimationsWidget extends StatefulWidget {
  const MultiAnimationsWidget({Key? key}) : super(key: key);

  @override
  MultiAnimationsState createState() => MultiAnimationsState();
}

class MultiAnimationsState extends State<MultiAnimationsWidget> {
  /// Controller for playback
  Artboard? _playButtonArtboard;
  SMIInput<bool>? _playButtonInput;
  /// Is the animation currently playing?
  bool isPlaying = false;

  bool isReaction = false;
  @override
  void initState() {
    super.initState();
      rootBundle.load('assets/animation/match_deck_new_copy.riv').then(
          (data) {
        final file = RiveFile.import(data);
        final List<Artboard> listArtBoard= file.artboards;
        file.artboards.forEach((_artboard) {
          print('=======================================');
          print('#######>ARTBOARD<######');
          print('#artboards name ${_artboard.name}');
          print('##artboards animations ${_artboard.animations.length}');
          _artboard.animations.forEach((animation) {
            print('#####>ANIMATION<########');
            print('##animation id ${animation.id}');
            print('#animation name ${animation.name}');
          });
          _artboard.stateMachines.forEach((element) {
            print('#####################');
            print('#stateMachines name ${element.name}');
            element.inputs.forEach((input) {
              print('##inputs ${input.name}');
            });

          });
          print('=======================================');
        });
        final myArtBoard = listArtBoard[2];
        final stateMachineName = myArtBoard.stateMachines.first.name;
        final inputName = myArtBoard.stateMachines.first.inputs.first.name;
        print('myArtBoard.name ${myArtBoard.artboard.name}');
        print('myArtBoard.stateMachines.name ${myArtBoard.stateMachines.first.name}');
        print('myArtBoard.inputs.name ${myArtBoard.stateMachines.first.inputs.first.name}');
        var controller = StateMachineController.fromArtboard(
            myArtBoard,
            stateMachineName,
            onStateChange: (oldState, newState){
              print('oldState $oldState');
              print('newState $newState');
            }
        );
        if (controller != null) {
          myArtBoard.addController(controller);
          _playButtonInput = controller.findInput(inputName);
          _playButtonInput?.value = false;
        }
        setState(() => _playButtonArtboard = myArtBoard);
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
                color: Colors.white54,
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


