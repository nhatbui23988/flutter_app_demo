

import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DemoAudioPlayer extends StatefulWidget {
  DemoAudioPlayer({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  final audios = <Audio>[
    Audio(
      'assets/audios/send_message.mp3',
      metas: Metas(
        id: 'send_message',
        title: 'Send Message',
      ),
    ),
    Audio(
      'assets/audios/reaction.mp3',
      metas: Metas(
        id: 'reaction',
        title: 'Reaction',
      ),
    ),
    Audio(
      'assets/audios/input_message.mp3',
      metas: Metas(
        id: 'input_message',
        title: 'Input Message',
      ),
    ),
  ];

  @override
  State<DemoAudioPlayer> createState() => _DemoAudioPlayerState();
}

class _DemoAudioPlayerState extends State<DemoAudioPlayer> {
  int _counter = 0;

  late AssetsAudioPlayer _assetsAudioPlayer;
  final List<StreamSubscription> _subscriptions = [];
  final audios = <Audio>[
    Audio(
      'assets/audios/send_message.mp3',
      metas: Metas(
        id: 'send_message',
        title: 'Send Message',
        image: MetasImage.network(
            'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
      ),
    ),
    Audio(
      'assets/audios/reaction.mp3',
      metas: Metas(
          id: 'reaction',
          title: 'Reaction',
          image: MetasImage.network(
              'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg')),
    ),
    Audio(
      'assets/audios/input_message.mp3',
      metas: Metas(
        id: 'input_message',
        title: 'Input Message',
        image: MetasImage.network(
            'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    //_subscriptions.add(_assetsAudioPlayer.playlistFinished.listen((data) {
    //  print('finished : $data');
    //}));
    //openPlayer();
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print('audioSessionId : $sessionId');
    }));

    openPlayer();
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 72),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                    audios.length,
                        (index) => ListTile(
                      tileColor: Colors.amber,
                      onTap: () {
                        _playAudio(audios[index]);
                      },
                      title: Text(audios[index].metas.title ?? ''),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _playAudio(Audio audio){
    _assetsAudioPlayer.open(audio, autoStart: true);
  }
}