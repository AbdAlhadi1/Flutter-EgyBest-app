import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({super.key});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController Ycontroller= YoutubePlayerController(
    initialVideoId: "lLaUFVSTYKw",
    flags:const YoutubePlayerFlags(
      mute: false,
      autoPlay: false,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 15,
        color: Colors.white,
        child: Column(children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
                child: Text(
                  "Trailer",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width-30,
            child: YoutubePlayer(
              controller: Ycontroller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20,)
        ]));
  }
}
