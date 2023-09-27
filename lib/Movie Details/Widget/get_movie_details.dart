
import 'package:Mova/Main%20calsses/movie.dart';
import 'package:Mova/Movie%20Details/Api/movie_details_api.dart';
import 'package:Mova/Movie%20Details/Screen/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
// ignore: must_be_immutable
class GetMovieDetails extends StatelessWidget {
  bool isLoggedIn;
  int movieId;
  GetMovieDetails({super.key,required this.movieId,required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    MovieDetailsApi ob = MovieDetailsApi();
    return Scaffold(
      body: FutureBuilder(
          future: ob.getMovieDetails(movieId),
          builder: (context,AsyncSnapshot<Tuple2<bool,Movie?>> snapshot ){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            } else {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data!.item1 == true){
                  return MovieDetails(isLoggedIn: isLoggedIn,movie: snapshot.data!.item2);
                } else {
                  return AlertDialog(
                    title: const Text("data"),
                    actions: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text("تأكيد")),
                    ],
                  );
                }
              } else {
                return AlertDialog(
                  title: const Text("data"),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: const Text("تأكيد")),
                  ],
                );
              }
            }
          }

      ),
    );
  }
}
