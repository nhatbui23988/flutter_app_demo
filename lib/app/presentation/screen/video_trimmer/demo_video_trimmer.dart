

import 'dart:io';

import 'package:app_demo/app/presentation/screen/video_trimmer/trimmer_viewer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_trimmer/video_trimmer.dart';

class DemoVideoTrimmer extends StatefulWidget {
  const DemoVideoTrimmer({Key? key}) : super(key: key);

  @override
  State<DemoVideoTrimmer> createState() => _DemoVideoTrimmerState();
}

class _DemoVideoTrimmerState extends State<DemoVideoTrimmer> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox.expand(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(onPressed: _pickVideo, child: Text('Pick Video'))
      ],),
    ));
  }

  void _pickVideo() async{
    final XFile? xFile = await _picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 10));
    String? videoPath = xFile?.path;
    if(videoPath != null){
      File file = File(videoPath);
      if(file.existsSync()){
        _startTrimVideo(file);
      }
    }
  }

  void _startTrimVideo(File videoFile) async{
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return TrimmerView(videoFile);
      }),
    );
  }
}
