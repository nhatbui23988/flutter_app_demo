// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:video_trimmer/video_trimmer.dart';
//
// class TrimmerView extends StatefulWidget {
//   final File file;
//
//   TrimmerView(this.file);
//
//   @override
//   _TrimmerViewState createState() => _TrimmerViewState();
// }
//
// class _TrimmerViewState extends State<TrimmerView> {
//   final Trimmer _trimmer = Trimmer();
//
//   double _startValue = 0.0;
//   double _endValue = 0.0;
//
//   bool _isPlaying = false;
//   bool _progressVisibility = false;
//
//   Future<String?> _saveVideo() async {
//     setState(() {
//       _progressVisibility = true;
//     });
//
//     String? _value;
//
//     await _trimmer.saveTrimmedVideo(
//         startValue: _startValue,
//         endValue: _endValue,
//         onSave: (String? outputPath) {
//           setState(() {
//             _progressVisibility = false;
//             _value = outputPath;
//             print('outputPath $outputPath');
//           });
//         });
//
//     return _value;
//   }
//
//   void _loadVideo() {
//     _trimmer.loadVideo(videoFile: widget.file);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _loadVideo();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Video Trimmer"),
//       ),
//       body: Builder(
//         builder: (context) => Center(
//           child: Container(
//             padding: const EdgeInsets.only(bottom: 30.0),
//             color: Colors.black,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Visibility(
//                   visible: _progressVisibility,
//                   child: const LinearProgressIndicator(
//                     backgroundColor: Colors.red,
//                   ),
//                 ),
//
//                 Expanded(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       VideoViewer(trimmer: _trimmer),
//                       TextButton(
//                         child: _isPlaying
//                             ? const Icon(
//                           Icons.pause,
//                           size: 80.0,
//                           color: Colors.white,
//                         )
//                             : const Icon(
//                           Icons.play_arrow,
//                           size: 80.0,
//                           color: Colors.white,
//                         ),
//                         onPressed: () async {
//                           bool playbackState = await _trimmer.videPlaybackControl(
//                             startValue: _startValue,
//                             endValue: _endValue,
//                           );
//                           setState(() {
//                             _isPlaying = playbackState;
//                           });
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Center(
//                   child: TrimEditor(
//                     trimmer: _trimmer,
//                     viewerHeight: 50.0,
//                     viewerWidth: MediaQuery.of(context).size.width,
//                     maxVideoLength: const Duration(seconds: 10),
//                     onChangeStart: (value) {
//                       _startValue = value;
//                     },
//                     onChangeEnd: (value) {
//                       _endValue = value;
//                     },
//                     onChangePlaybackState: (value) {
//                       setState(() {
//                         _isPlaying = value;
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 24,),
//                 ElevatedButton(
//                   onPressed: _progressVisibility
//                       ? null
//                       : () async {
//                     _saveVideo().then((outputPath) {
//                       print('OUTPUT PATH: $outputPath');
//                       const snackBar = SnackBar(
//                           content: Text('Video Saved successfully'));
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         snackBar,
//                       );
//                     });
//                   },
//                   child: const Text("SAVE"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
