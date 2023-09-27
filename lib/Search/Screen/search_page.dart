import 'dart:convert';


import 'package:Mova/HomePage/Widget/Movie_Item.dart';
import 'package:Mova/Main%20calsses/mini_move.dart';
import 'package:Mova/Main%20calsses/search_results.dart';
import 'package:Mova/Search/Widget/get_search_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchPage extends StatefulWidget {
  bool isLoggedIn;
  var searchResult;
  SearchPage({super.key,this.searchResult,required this.isLoggedIn});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<MiniMove> searchMovies ;//= widget.categoryPage[0].categoryMovies;
  bool isLoadingMore = false;
  late ScrollController scrollController;
  late String url;
  TextEditingController search =TextEditingController();
  Future loadeMore()async{
    if(isLoadingMore == false && url != ""){
      setState(() {
        isLoadingMore = true;
      });
      try{
        print("oppopop");
        Response response = await get(Uri.parse(url));
        if(response.statusCode == 200){
          var info = jsonDecode(response.body);
          List resultSize = info["results"];
          List<MiniMove> moviesResultss = [];
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
            moviesResultss.add(miniMove);
          }
          print(moviesResultss.length);
          SearchResultObject searchResultObject = SearchResultObject(info["count"],( info["next"]??""), (info["previous"]??""), moviesResultss);
          setState(() {
            url = searchResultObject.nextUrl;
            searchMovies += searchResultObject.searchResult;
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
    searchMovies = (widget.searchResult == null)?[]:widget.searchResult[0].searchResult;
    url = (widget.searchResult == null)?"":widget.searchResult[0].nextUrl;
    scrollController = ScrollController()..addListener(loadeMore);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  prefixIcon: IconButton(onPressed: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetSearchResult(isLoggedIn: widget.isLoggedIn,search: search)));

                  }, icon: const Icon(Icons.search)),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      search.text = "";
                    });
                  }, icon: const Icon(Icons.clear)),

                  hintText: "Search...",
                  border: InputBorder.none,
                  
                ),
              ),
            ),
          ),
        ),
        body: (searchMovies.length == 0)?Container():ListView(
          controller: scrollController,
          children: [
            for(int i=0;i<searchMovies.length;i++)Padding(
              padding: const EdgeInsets.only(bottom: 10,top :5),
              child: Center(child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 20,
                child:  Padding(
                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                  child: MovieItem(isLoggedIn: widget.isLoggedIn,movie: searchMovies[i]),
                ),
              )),
            ),
            if(isLoadingMore == true)const Padding(padding: EdgeInsets.only(top: 10,bottom: 40),child: Center(child: CircularProgressIndicator(),),)
          ],
        ),
      ),
    );
  }
}
