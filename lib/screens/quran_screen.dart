// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran_app/material.dart';
import 'package:rxdart/rxdart.dart';

// ignore: must_be_immutable
class QuranScreen extends StatefulWidget {
  QuranChapter chapter;
  late QuranChapter chapterQ;
  AlShaikh shaikh;
  late AlShaikh shaikhQ;
  late int indexQ;
  QuranScreen({required this.chapter, required this.shaikh, required int index,super.key,}) {
    chapterQ = chapter;
    shaikhQ = shaikh;
    indexQ = index;
  }
  @override
  State<QuranScreen> createState() => QuranScreenState();
}
class QuranScreenState extends State<QuranScreen> {
  bool playing = false;
  int justId = 1;
  late AudioPlayer player;
  var playerList = ConcatenatingAudioSource(
      children: []
  );
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
    setUp();
    super.initState();
    player = AudioPlayer();
    _init();
  }
  void setUp() {
    int index = widget.indexQ;
    String shaikhUrl = widget.shaikhQ.url;
    for(int i=0; i<hollyQuraan.length;i++)
    {
      if((index+i)<114)
      {
        playerList.add(
          AudioSource.uri(
              Uri.parse('https://server${shaikhUrl}/${hollyQuraan[index+i].number}.mp3'),
              tag: MediaItem(
                  id: '${justId+1}',
                  title: '${hollyQuraan[index+i].nameArabic}')
          ),
        );
      } else {
        playerList.add(
          AudioSource.uri(
              Uri.parse('https://server${shaikhUrl}/${hollyQuraan[index-(114-i)].number}.mp3'),
              tag: MediaItem(
                  id: '${justId+1}',
                  title: '${hollyQuraan[index-(114-i)].nameArabic}')
          ),
        );
      }
    }
  }
  Future<void> _init()async{
    await player.setLoopMode(LoopMode.all);
    await player.setAudioSource(playerList);
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
              Colors.blueGrey.shade300,
              Colors.blueGrey.shade600
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
                SizedBox(height: 18.0),
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
                      children: [
                        Container(
                          width: 500.0,
                        ),
                        StreamBuilder<SequenceState?>(
                            stream: player.sequenceStateStream,
                            builder: (context, snapshot) {
                              final state = snapshot.data;
                              if(state?.sequence.isEmpty ?? true){
                                return SizedBox();
                              }
                              final metadata = state!.currentSource!.tag as MediaItem;
                              return MediaMetaData(
                                  image: widget.shaikhQ.image,
                                  title: metadata.title,
                                  qara: widget.shaikhQ.name);
                            }),
                        SizedBox(height: 20.0,),
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
                        SizedBox(height: 20.0,),
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

class MediaMetaData extends StatelessWidget{
  const MediaMetaData({
    super.key,
    required this.image,
    required this.title,
    required this.qara
  });
  final String image;
  final String title;
  final String qara;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DecoratedBox(decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 4),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(image: AssetImage(image),height: 300,width: 300,fit:BoxFit.cover,),
        ),
      ),
      SizedBox(height: 20,),
      Text(title,style: TextStyle(color: Colors.white,fontSize: 22),textAlign: TextAlign.center,),
      SizedBox(height: 20,),
      Text(qara,style: TextStyle(color: Colors.white70,fontSize: 19),textAlign: TextAlign.center,),
    ]
    );
  }

}

class Controls extends StatelessWidget {
  const Controls({
    super.key, required this.player
  });

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed:player.seekToPrevious,
          icon: Icon(Icons.skip_previous_rounded),
          iconSize: 70,color: Colors.white,
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: player.play,
                icon: Icon(Icons.play_arrow_rounded),
                iconSize: 80.0,
                color: Colors.white,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: player.pause,
                icon: Icon(Icons.pause_rounded),
                iconSize: 80.0,
                color: Colors.white,
              );
            }
            else {
              Navigator.pop(context);
              return IconButton(
                onPressed: player.play,
                icon: Icon(Icons.play_arrow_rounded),
                iconSize: 80.0,
                color: Colors.white,
              );
            }
          },
        ),
        IconButton(
          onPressed:player.seekToNext,
          icon: Icon(Icons.skip_next_rounded),
          iconSize: 70,color: Colors.white,
        ),
      ],
    );
  }
}
