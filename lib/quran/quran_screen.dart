// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/material.dart';
import 'package:rxdart/rxdart.dart';

class QuranScreen extends StatefulWidget {
  QuranChapter chapter;
  late QuranChapter chapterQ;

  AlShaikh shaikh;
  late AlShaikh shaikhQ;

  QuranScreen({required this.chapter, required this.shaikh, super.key}) {
    chapterQ = chapter;
    shaikhQ = shaikh;
  }

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  bool playing = false;
  IconData playButton = Icons.play_arrow;
  late AudioPlayer player;

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    if (widget.shaikhQ.name == 'اسلام صبحي') {
      player = AudioPlayer()
        ..setUrl('${widget.shaikhQ.url}/${widget.chapterQ.number}.mp3');
    } else if (widget.shaikhQ.name == 'حسن صالح') {
      player = AudioPlayer()
        ..setUrl('${widget.shaikhQ.url}/${widget.chapterQ.number}.mp3');
    } else
      player = AudioPlayer()
        ..setUrl(
            'https://server${widget.shaikhQ.url}/${widget.chapterQ.number}.mp3');
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.brown[200]!,
              Colors.brown,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 48.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    ' سورة ${widget.chapterQ.nameArabic}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    ' القارئ الشيخ ${widget.shaikhQ.name}',
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: AssetImage('${widget.shaikhQ.image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                        ),
                        StreamBuilder<PositionData>(
                            stream: positionDataStream,
                            builder: (context, snapshot) {
                              final positionData = snapshot.data;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ProgressBar(
                                  barHeight: 8.0,
                                  baseBarColor: Colors.white,
                                  bufferedBarColor: Colors.grey,
                                  progressBarColor: Colors.blue,
                                  thumbColor: Colors.blue,
                                  timeLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  progress:
                                      positionData?.position ?? Duration.zero,
                                  buffered: positionData?.bufferedPosition ??
                                      Duration.zero,
                                  total:
                                      positionData?.duration ?? Duration.zero,
                                  onSeek: player.seek,
                                ),
                              );
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Controls(player: player),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (!(playing ?? false))
            return IconButton(
              onPressed: player.play,
              icon: Icon(Icons.play_arrow_rounded),
              iconSize: 80.0,
              color: Colors.white,
            );
          else if (processingState != ProcessingState.completed) {
            return IconButton(
              onPressed: player.pause,
              icon: Icon(Icons.pause_rounded),
              iconSize: 80.0,
              color: Colors.white,
            );
          }
          return IconButton(
            onPressed: () {
              if (processingState == ProcessingState.completed) {
                ProcessingState.buffering;
                player.play;
              }
            },
            icon: Icon(Icons.play_arrow_rounded),
            iconSize: 80.0,
            color: Colors.white,
          );
        });
  }
}
