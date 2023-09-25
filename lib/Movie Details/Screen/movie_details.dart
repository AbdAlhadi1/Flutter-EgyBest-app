import 'package:egybest_app/HomePage/Widget/Most_view_section.dart';
import 'package:egybest_app/Main%20calsses/movie.dart';
import 'package:egybest_app/Movie%20Details/Widget/details_table_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/movie_heroes.dart';
import 'package:egybest_app/Movie%20Details/Widget/movie_sotry_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/photo_and_downloade_button_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/trailer_for_the_movie_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieDetails extends StatefulWidget {
  Movie? movie;
  MovieDetails({super.key,required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body:  SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhotoAndDownloadButton(movie: widget.movie),
                const SizedBox(height: 20,),
                DetailsTable(movie: widget.movie,),
                const SizedBox(height: 20,),
                MovieStory(movie: widget.movie),
                const SizedBox(height: 20,),
                MovieTrailer(movie: widget.movie,),
                const SizedBox(height: 20,),
                MovieHeroes(movieHeroes:widget.movie!.movieHeroes),
                const SizedBox(height: 20,),
                Visibility(
                    visible: widget.movie!.relatedMovies.isEmpty? false:true,
                    child: HomePageSections(title: "افلام ذات صلة", moviesList:widget.movie!.relatedMovies)),
                const SizedBox(height: 50,)
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
