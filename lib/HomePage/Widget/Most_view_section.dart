// ignore: file_names
import 'package:egybest_app/Category/Widget/get_category_movies.dart';
import 'package:egybest_app/HomePage/Widget/Movie_Item.dart';
import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageSections extends StatelessWidget {
  int categoryId;
  String title;
  List <MiniMove> moviesList;
  HomePageSections({super.key,required this.title,required this.moviesList,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 330,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: title,style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetCategoryMovies(categoryId: categoryId)));
                    },
                    child: RichText(
                      text: const TextSpan(text: "المزيد", style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17
                        )),
                    ),),)],),
            SizedBox(
              height: 260,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                    for(int i=0;i<moviesList.length;i++)Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                       child: Center(child: MovieItem(movie: moviesList[i],)),
                     ),
                  ],
                ),
            ),
          ],
        )
      ),
    );
  }
}
