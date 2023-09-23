import 'dart:convert';

import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/category_page.dart';
import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:egybest_app/Server/server.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class CategoryApi{

  Future<Tuple2<bool,CategoryPage?>> getCategoryPage(int categoryId)async{
    try{
      Response response = await get(Uri.parse("${Server.host}${Server.getCategory}$categoryId"));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        Category category = Category(info["id"], info["name"], info["icon"]);
        List categoryMovieSize = info["related_movies"]["results"];
        List <MiniMove> categoryMovies = [];
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
              categoryMovies.add(miniMove);
        }
        CategoryPage categoryPage = CategoryPage(category, categoryMovies, info["related_movies"]["count"], info["related_movies"]["next"], info["related_movies"]["previous"]);
        return Tuple2(true, categoryPage);
      } else {
        print (response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, null);
      }
    }catch(error){
      print(error);
      return const Tuple2(false, null);
    }
  }



}