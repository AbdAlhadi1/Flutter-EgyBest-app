import 'package:egybest_app/Movie%20Details/Widget/details_table_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/download_table_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/movie_sotry_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/photo_and_downloade_button_for_movie_details.dart';
import 'package:egybest_app/Movie%20Details/Widget/trailer_for_the_movie_details.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

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
          body: const SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhotoAndDownloadButton(),
                SizedBox(height: 20,),
                DetailsTable(),
                SizedBox(height: 20,),
                MovieStory(),
                SizedBox(height: 20,),
                MovieTrailer(),
                SizedBox(height: 20,),
                DownloadTable(),
                SizedBox(height: 50,)
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
