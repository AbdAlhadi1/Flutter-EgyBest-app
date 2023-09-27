import 'package:Mova/Main%20calsses/search_results.dart';
import 'package:Mova/Search/Api/search_page_Api.dart';
import 'package:Mova/Search/Screen/search_page.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class GetSearchResult extends StatelessWidget {
  bool isLoggedIn;
  TextEditingController search;
  GetSearchResult({super.key,required this.search,required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    SearchPageApi ob = SearchPageApi();
    return Scaffold(
      body: FutureBuilder(
        future: ob.movieSearch(search),
        builder: (context, AsyncSnapshot<Tuple2<bool,List<SearchResultObject>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          } else {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data!.item1 == true){
                return  SearchPage(isLoggedIn: isLoggedIn,searchResult: snapshot.data!.item2,);
              } else {
                return AlertDialog(
                  title: const Text(""),
                  actions: [
                    ElevatedButton(onPressed: (){

                    }, child: const Text("تأكيد")),
                  ],
                );
              }
            } else {
              return AlertDialog(
                title: const Text(""),
                actions: [
                  ElevatedButton(onPressed: (){

                  }, child: const Text("تأكيد")),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
