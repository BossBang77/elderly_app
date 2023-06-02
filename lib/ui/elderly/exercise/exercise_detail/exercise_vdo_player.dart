import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:video_player/video_player.dart';

class ExerciseVdoPlayer extends StatefulWidget {
  const ExerciseVdoPlayer({super.key});

  @override
  State<ExerciseVdoPlayer> createState() => _ExerciseVdoPlayerState();
}

class _ExerciseVdoPlayerState extends State<ExerciseVdoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isEndVideo = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.value.position.inSeconds > 0) {
        if (_controller.value.position == _controller.value.duration) {
          setState(() {
            isEndVideo = true;
            _controller.pause();
          });
        }
      }
    });
    var sized = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Stack(
                  children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    height: sized.height * 0.35,
                    width: sized.width,
                    decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, VideoPlayerValue value, child) {
                            String time = [
                              value.position.inMinutes,
                              value.position.inSeconds
                            ]
                                .map((seg) => seg
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, '0'))
                                .join(':');
                            return textH4(time, color.black87);
                          },
                        ),
                        textSubtitle16Blod('ระยะเวลา', Colors.grey),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            InkWell(
                              onTap: () {
                                if (!isEndVideo) {
                                  setState(() {
                                    // If the video is playing, pause it.
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controller.play();
                                    }
                                  });
                                }
                              },
                              child: Image.asset(
                                _controller.value.isPlaying
                                    ? 'assets/images/player_puse.png'
                                    : 'assets/images/player_start.png',
                                scale: 4,
                                color: isEndVideo ? color.grey50 : null,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // If the video is playing, pause it.
                                  _controller.pause();
                                  var value = _controller.value;
                                  String time = [
                                    value.position.inMinutes,
                                    value.position.inSeconds
                                  ]
                                      .map((seg) => seg
                                          .remainder(60)
                                          .toString()
                                          .padLeft(2, '0'))
                                      .join(':');

                                  context
                                      .read<ExerciseBloc>()
                                      .add(ExerciseVdoFinish(time: time));
                                });
                              },
                              child: Image.asset(
                                'assets/images/player_stop.png',
                                scale: 4,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: color.Primary,
              ),
            );
          }
        },
      ),
    );
  }
}
