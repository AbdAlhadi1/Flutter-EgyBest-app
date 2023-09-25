import 'dart:convert';

import 'package:egybest_app/HomePage/Widget/Movie_Item.dart';
import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/category_page.dart';
import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class CategoryMovies extends StatefulWidget {
  List<CategoryPage> categoryPage;
  CategoryMovies({super.key,required this.categoryPage});

  @override
  State<CategoryMovies> createState() => _CategoryMoviesState();
}

class _CategoryMoviesState extends State<CategoryMovies> {
  late List<MiniMove> categoryMovies ;//= widget.categoryPage[0].categoryMovies;
  bool isLoadingMore = false;
  late ScrollController scrollController;
  late String url; //= widget.categoryPage[0].nextPageUrl;

  Future loadeMore()async{
    if(isLoadingMore == false && url != ""){
      setState(() {
        isLoadingMore = true;
      });
      try{
        print("oppopop");
        Response response = await get(Uri.parse(url));
        if(response.statusCode == 200){
          //print(response.statusCode);
          var info = jsonDecode(response.body);
          Category category = Category(info["id"], info["name"], info["icon"]);
          List categoryMovieSize = info["related_movies"]["results"];
          List <MiniMove> categoryMoviess = [];
          for(int i=0;i<categoryMovieSize.length;i++){
            MiniMove miniMove = MiniMove(
                info["related_movies"]["results"][i]["id"],
                info["related_movies"]["results"][i]["name"],
                info["related_movies"]["results"][i]["cityAndLanguage"],
                info["related_movies"]["results"][i]["movie_type"],
                info["related_movies"]["results"][i]["time"],
                info["related_movies"]["results"][i]["movies_image"],
                info["related_movies"]["results"][i]["movie_url"],
                info["related_movies"]["results"][i]["description"],
                info["related_movies"]["results"][i]["final_rate"],
                info["related_movies"]["results"][i]["quality"],
                info["related_movies"]["results"][i]["trailer_url"]);
            categoryMoviess.add(miniMove);
          }
          CategoryPage categoryPage = CategoryPage(category, categoryMoviess, info["related_movies"]["count"], (info["related_movies"]["next"]??""), ( info["related_movies"]["previous"]??""));
          setState(() {
            url = categoryPage.nextPageUrl;
            categoryMovies += categoryPage.categoryMovies;
          });
        } else {

        }
      }catch(error){

      }
      setState(() {
        isLoadingMore = false;
      });
    }
  }
  @override
  void initState() {
    url = widget.categoryPage[0].nextPageUrl;
    categoryMovies = widget.categoryPage[0].categoryMovies;
    scrollController = ScrollController()..addListener(loadeMore);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.categoryPage[0].category.name),

          ),
          body:ListView(
              controller: scrollController,
              children: [
                for(int i=0;i<categoryMovies.length;i++)Padding(
                  padding: const EdgeInsets.only(bottom: 10,top :5),
                  child: Center(child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width - 20,
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7),
                      child: MovieItem(movie: categoryMovies[i]),
                    ),
                  )),
                ),
                if(isLoadingMore == true)const Padding(padding: EdgeInsets.only(top: 10,bottom: 40),child: Center(child: CircularProgressIndicator(),),)

              ],
            ),
        ),
      ),
    );
  }
}
