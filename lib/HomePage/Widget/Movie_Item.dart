import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:egybest_app/Movie%20Details/Widget/get_movie_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieItem extends StatelessWidget {
  MiniMove movie;
  MovieItem({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GetMovieDetails(movieId: movie.movieId)));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             SizedBox(
               //color: Colors.blueAccent,
                height: 230,
                width: 180,
                child: Stack(
                    children:[
                      Image(image:NetworkImage(movie.movieImage),fit: BoxFit.fill,width: 180,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                            const Icon(Icons.star,color: Colors.yellow,size: 45,),
                            Positioned(
                                right: 13,
                                top: 16,
                                child: RichText(text: TextSpan(text: movie.finalRate.toString(),style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600
                                ))))
                          ],),
                          Container(
                            decoration:const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(13),topRight: Radius.circular(13),
                              bottomRight: Radius.circular(13))
                              
                            ),
                            height: 30,
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.only(right: 7,left: 7),
                                child: Text("Blu-Ray",style: TextStyle(
                                    color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                          )
                      ],),
                        /*Padding(
                            padding: const EdgeInsets.only(top: 0,right: 90),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              //mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ,
                            ],),
                          ),*/
                ])
            ),
            const SizedBox(height: 5,),
            RichText(text: TextSpan(text: movie.movieName,style: const TextStyle(
                color: Colors.indigo
            )))
          ],
        ),
      );
  }
}