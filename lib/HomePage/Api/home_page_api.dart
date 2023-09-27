import 'dart:convert';
import 'package:Mova/Main%20calsses/category.dart';
import 'package:Mova/Main%20calsses/home_page_sections.dart';
import 'package:Mova/Main%20calsses/mini_move.dart';
import 'package:Mova/Server/server.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class HomePageApi{

  // get home page sections
  // in this function we load the home page section and there movie from the server
  // we create a list of the home page section objects and fetch the date in it and return it

  Future<Tuple2<bool,List<HomePageSection>>> getHomePageSection()async{
    try{
      
      Response response = await get(Uri.parse(Server.host+Server.homePageSection));
      if(response.statusCode == 200){
        print(response.statusCode);

        var info = jsonDecode(response.body);
        List infoLength = info;

        List<HomePageSection> homePageSections =[];

        for(int i=0;i<infoLength.length;i++){
          Category category = Category(
              info[i]["id"],
              info[i]["name"],
              info[i]["icon"]);

              var resultLength = info[i]["results"];
              int size = (resultLength.length?? 0);
              List<MiniMove> categoryMovies = [];
              for(int j=0;j<size;j++){
                  /*print(info[i]["results"][j]["id"].runtimeType);
                  print(info[i]["results"][j]["name"].runtimeType);
                  print(info[i]["results"][j]["cityAndLanguage"].runtimeType);
                  print(info[i]["results"][j]["movie_type"].runtimeType);
                  print(info[i]["results"][j]["time"].runtimeType);
                  print("abd");
                  print(info[i]["results"][j]["movie_image"].runtimeType);
                  print("alhadi");
                  print(info[i]["results"][j]["movie_url"].runtimeType);
                  print(info[i]["results"][j]["description"].runtimeType);
                  print(info[i]["results"][j]["quality_id"].runtimeType);
                  print(info[i]["results"][j]["trailer_url"].runtimeType);*/
                  //print(info[i]["results"][j]["quality_id"].runtimeType);

                MiniMove miniMove = MiniMove(
                    info[i]["results"][j]["id"],
                    info[i]["results"][j]["name"],
                    info[i]["results"][j]["cityAndLanguage"],
                    info[i]["results"][j]["movie_type"],
                    info[i]["results"][j]["time"],
                    info[i]["results"][j]["movies_image"],
                    info[i]["results"][j]["movie_url"],
                    info[i]["results"][j]["description"],
                    info[i]["results"][j]["final_rate"],
                    (info[i]["results"][j]["quality_id"]??0),
                    info[i]["results"][j]["trailer_url"]);
                categoryMovies.add(miniMove);
              }
              HomePageSection homePageSection = HomePageSection(category, categoryMovies);
              homePageSections.add(homePageSection);
        }
        return Tuple2(true, homePageSections);

      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, []);

      }
      
    }catch(error){
      print(error);
      return const Tuple2(false, []);
    }
    
  }

  // get home page category
  // in this function we get the main category and we return a list of category objects

  Future<Tuple2<bool,List<Category>>> getHomePageCategory() async {
    
    try{
      Response response = await get(Uri.parse(Server.host+Server.listCategory));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        List<Category> categoryList = [];
        List responseLength = info;
        print(responseLength.length);
        for(int i=0;i<responseLength.length;i++){

          Category category = Category(
              info[i]["id"],
              info[i]["name"],
              info[i]["icon"]);
          categoryList.add(category);
        }
        return Tuple2(true, categoryList);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, []);
      }
    }catch(error){
      print(error);
      return const Tuple2(false, []);
    }
    
  }
  
}