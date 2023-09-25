import 'package:egybest_app/Main%20calsses/search_results.dart';
import 'package:egybest_app/Search/Api/search_page_Api.dart';
import 'package:egybest_app/Search/Screen/search_page.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class GetSearchResult extends StatelessWidget {
  TextEditingController search;
  GetSearchResult({super.key,required this.search});

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
                return  SearchPage(searchResult: snapshot.data!.item2,);
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
