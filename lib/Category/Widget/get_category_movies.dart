import 'package:egybest_app/Category/Api/categroy_api.dart';
import 'package:egybest_app/Category/Screen/category_movies.dart';
import 'package:egybest_app/Main%20calsses/category_page.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class GetCategoryMovies extends StatelessWidget {
  int categoryId;
  GetCategoryMovies({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    CategoryApi ob = CategoryApi();
    return Scaffold(
      body: FutureBuilder(
          future: ob.getCategoryPage(categoryId),
          builder: (context,AsyncSnapshot<Tuple2<bool,List<CategoryPage>>> snapshot ){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            } else {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data!.item1 == true){
                  return CategoryMovies(categoryPage: snapshot.data!.item2);
                } else {
                  return AlertDialog(
                    title: const Text("data"),
                    actions: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text("تأكيد")),
                    ],
                  );
                }
              } else {
                return AlertDialog(
                  title: const Text("data"),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: const Text("تأكيد")),
                  ],
                );
              }
            }
          }

      ),
    );
  }
}
