import 'dart:convert';

import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:egybest_app/Main%20calsses/movie.dart';
import 'package:egybest_app/Main%20calsses/movie_hero.dart';
import 'package:egybest_app/Main%20calsses/quality.dart';
import 'package:egybest_app/Main%20calsses/translation.dart';
import 'package:egybest_app/Server/server.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class MovieDetailsApi{

  Future <Tuple2<bool,Movie?>> getMovieDetails (int movieId)async{

    try{
      
      Response response = await get(Uri.parse("${Server.host}${Server.movieDetails}$movieId"));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        MiniMove miniMove = MiniMove(
            info["id"],
            info["name"],
            info["cityAndLanguage"],
            info["movie_type"],
            info["time"],
            info["movies_image"],
            info["movie_url"],
            info["description"],
            info["final_rate"],
            0,
            info["trailer_url"]);
        print("aaaaaaaaaaaaaa");
        Quality quality = Quality(
            info["quality"]["id"],
            info["quality"]["name"]);
        print("bbbbbbbbbbbbbb");
        Translation translation = Translation(
            info["translation"]["id"],
            info["translation"]["name"]);
        print("cccccccccccccc");
        List<Category> movieCategories = [];
        List movieCategoriesSize = info["category"];
        for(int j=0;j<movieCategoriesSize.length;j++){
          Category category = Category(info["category"][j]["id"], info["category"][j]["name"], info["category"][j]["icon"]);
          movieCategories.add(category);
        }
        print("dddddddddddddd");
        List<MovieHero> movieHeroes = [];
        List movieHeroesSize = info["heros"];

        for(int j = 0 ;j<movieHeroesSize.length;j++){
          MovieHero movieHero = MovieHero(info["heros"][j]["id"],info["heros"][j]["heroFullName"],info["heros"][j]["heroImage"], info["heros"][j]["heroRole"]);
          movieHeroes.add(movieHero);
        }
        print("eeeeeeeeeeeeeee");
        List <MiniMove> relatedMovies = [];
        List relatedMoviesSize = info["related_movies"];
        for(int j = 0;j<relatedMoviesSize.length;j++){
          MiniMove miniMove = MiniMove(
              info["related_movies"][j]["id"],
              info["related_movies"][j]["name"],
              info["related_movies"][j]["cityAndLanguage"],
              info["related_movies"][j]["movie_type"],
              info["related_movies"][j]["time"],
              info["related_movies"][j]["movies_image"],
              info["related_movies"][j]["movie_url"],
              info["related_movies"][j]["description"],
              info["related_movies"][j]["final_rate"],
              (info["related_movies"][j]["quality_id"]??0),
              info["related_movies"][j]["trailer_url"]);
          relatedMovies.add(miniMove);
        }
        Movie movie = Movie(miniMove, quality, translation, movieCategories, movieHeroes, relatedMovies);
        return Tuple2(true, movie);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, null);
      }

    }catch(error){
      print(error);
      return const Tuple2(false, null);
    }

  }

}