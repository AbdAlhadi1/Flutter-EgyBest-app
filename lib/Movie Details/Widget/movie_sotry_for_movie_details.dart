import 'package:Mova/Main%20calsses/movie.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieStory extends StatelessWidget {
  Movie? movie;
  MovieStory({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      color: Colors.white,
      child:  Column(
        children: [
         const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30,top: 10,bottom: 10),
                child:Text("القصة",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35,top: 15,bottom: 15),
            child: RichText(text: TextSpan(text: movie!.moveInfo.description,style: const TextStyle(
              color: Colors.black,
              fontSize: 17,wordSpacing: 1,
            )),textDirection:TextDirection.ltr),
          ),
        ],
      ),
    );
  }
}
