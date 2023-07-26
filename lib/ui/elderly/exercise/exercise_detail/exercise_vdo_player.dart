import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseVdoPlayer extends StatefulWidget {
  const ExerciseVdoPlayer({super.key, required this.videoLink});
  final String videoLink;

  @override
  State<ExerciseVdoPlayer> createState() => _ExerciseVdoPlayerState();
}

class _ExerciseVdoPlayerState extends State<ExerciseVdoPlayer> {
  bool isEndVideo = false;
  String? videoId;

  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();

    videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
    _ytController = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          disableDragSeek: true,
          enableCaption: false,
          hideThumbnail: true,
          showLiveFullscreenButton: true),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _ytController.addListener(() {
      var _current = _ytController.value.position.inSeconds;
      var _totalDuration = _ytController.metadata.duration.inSeconds;

      if (_ytController.value.position.inMilliseconds > 0) {
        if (_current == _totalDuration) {
          setState(() {
            isEndVideo = true;
            _ytController.pause();
          });
        }
      }
    });

    var sized = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(onBack: () {
        context
            .read<ExerciseBloc>()
            .add(ChangeView(exerciseView: ExerciseView.exerciseDetail));
      }),
      body: widget.videoLink.isNotEmpty
          ? YoutubePlayerBuilder(
              player: YoutubePlayer(
                aspectRatio: 10 / 9,
                controller: _ytController,
                bottomActions: [
                  CurrentPosition(),
                ],
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    player,
                    Container(
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
                            valueListenable: _ytController,
                            builder: (context, value, child) {
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
                                      if (_ytController.value.isPlaying) {
                                        _ytController.pause();
                                      } else {
                                        // If the video is paused, play it.
                                        _ytController.play();
                                      }
                                    });
                                  }
                                },
                                child: Image.asset(
                                  !_ytController.value.isPlaying
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
                                    _ytController.pause();
                                    var value = _ytController.value;
                                    int inSeconds = value.position.inSeconds;
                                    String time = [
                                      value.position.inMinutes,
                                      value.position.inSeconds
                                    ]
                                        .map((seg) => seg
                                            .remainder(60)
                                            .toString()
                                            .padLeft(2, '0'))
                                        .join('.');

                                    context.read<ExerciseBloc>().add(
                                        ExerciseVdoFinish(
                                            time: time, inSeconds: inSeconds));
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
                  ],
                );
              })
          : Container(
              child: Center(child: textH7('Video NotFound', color.greyText)),
            ),
    );
  }
}
