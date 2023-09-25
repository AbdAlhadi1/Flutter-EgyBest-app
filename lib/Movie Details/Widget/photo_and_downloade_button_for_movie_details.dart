import 'package:egybest_app/Main%20calsses/movie.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class PhotoAndDownloadButton extends StatelessWidget {
  Movie? movie;
  PhotoAndDownloadButton({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Padding(
          padding: const EdgeInsets.only(top: 40,bottom: 25),
          child: Center(
            child: SizedBox(
              height:420,
              width: 300,
              child: Image(image: NetworkImage(movie!.moveInfo.movieImage),fit: BoxFit.fill,),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(right: 78,left: 78),
            backgroundColor: Colors.green,
          ),
          onPressed: (){
            //lunchLink(movie);
            //lunchLink(movie!);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.download_for_offline),
              SizedBox(width: 7,),
              Text("مشاهدة وتحميل الفيلم"),
            ],
          ),
        )
      ],
    );
  }
}
