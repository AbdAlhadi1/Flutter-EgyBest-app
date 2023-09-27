import 'package:Mova/Category/Api/categroy_api.dart';
import 'package:Mova/Category/Screen/category_movies.dart';
import 'package:Mova/Main%20calsses/category_page.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class GetCategoryMovies extends StatelessWidget {
  int categoryId;
  bool isLoggedIn;
  GetCategoryMovies({super.key,required this.categoryId,required this.isLoggedIn});

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
                  return CategoryMovies(categoryPage: snapshot.data!.item2,isLoggedIn:isLoggedIn,);
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
