import 'package:Mova/Main%20calsses/movie.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class MovieTrailer extends StatefulWidget {
  Movie? movie;
  MovieTrailer({super.key,required this.movie});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  String trailerId = "";
  @override
  void initState() {
    print(widget.movie!.moveInfo.trailerUrl);
    int count = 0;
    for(int i=0;i<widget.movie!.moveInfo.trailerUrl.length;i++){
      if(widget.movie!.moveInfo.trailerUrl[i] == "/"){
        count++;
        if(count == 4){
          for(int j = i+1 ; j < widget.movie!.moveInfo.trailerUrl.length;j++){
            if(widget.movie!.moveInfo.trailerUrl[j]!="?") {
              trailerId+=widget.movie!.moveInfo.trailerUrl[j];
            } else {
              break;
            }
          }
        }
      }
    }
    //print(trailerId);
    super.initState();
  }

  late YoutubePlayerController Ycontroller= YoutubePlayerController(
    initialVideoId: trailerId,
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
