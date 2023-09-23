import 'package:egybest_app/HomePage/Widget/Movie_Item.dart';
import 'package:egybest_app/Main%20calsses/category_page.dart';
import 'package:flutter/material.dart';

class CategoryMovies extends StatefulWidget {
  CategoryPage? categoryPage;
  CategoryMovies({super.key,required this.categoryPage});

  @override
  State<CategoryMovies> createState() => _CategoryMoviesState();
}

class _CategoryMoviesState extends State<CategoryMovies> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                for(int i=0;i<widget.categoryPage!.categoryMovies.length;i++)MovieItem(movie: widget.categoryPage!.categoryMovies[i]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
