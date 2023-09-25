import 'dart:convert';

import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:egybest_app/Main%20calsses/search_results.dart';
import 'package:egybest_app/Server/server.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class SearchPageApi{

  Future<Tuple2<bool,List<SearchResultObject>>> movieSearch(TextEditingController search) async{
    try{
      Response response = await get(Uri.parse("${Server.host}${Server.search}?search=${search.text}"));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        List resultSize = info["results"];
        List<MiniMove> moviesResults = [];
        for(int i=0;i<resultSize.length;i++){
          MiniMove miniMove = MiniMove(
              info["results"][i]["id"],
              info["results"][i]["name"],
              info["results"][i]["cityAndLanguage"],
              info["results"][i]["movie_type"],
              info["results"][i]["time"],
              info["results"][i]["movies_image"],
              info["results"][i]["movie_url"],
              info["results"][i]["description"],
              info["results"][i]["final_rate"],
              info["results"][i]["quality"],
              info["results"][i]["trailer_url"]);
          moviesResults.add(miniMove);
        }
        print(moviesResults.length);
        SearchResultObject searchResultObject = SearchResultObject(info["count"],( info["next"]??""), (info["previous"]??""), moviesResults);
        return Tuple2(true, [searchResultObject]);

      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, []);
      }
    } catch(error) {
      print(error);
      return const Tuple2(false, []);
    }
  }


}