import 'package:egybest_app/HomePage/Api/home_page_api.dart';
import 'package:egybest_app/HomePage/Screen/home_page.dart';
import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/home_page_sections.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class GetHomePageCategory extends StatelessWidget {
  List<HomePageSection> homePageSection;
   GetHomePageCategory({super.key,required this.homePageSection});

  @override
  Widget build(BuildContext context) {
    HomePageApi ob = HomePageApi();
    return FutureBuilder(
      future: ob.getHomePageCategory(),
      builder: (context,AsyncSnapshot<Tuple2<bool,List<Category>>> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data!.item1 == true){
              return HomePage(
                category: snapshot.data!.item2,
                homePageSection: homePageSection,
              );
            } else {
              return AlertDialog(
                title: const Text("data"),
                actions: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).canPop();
                      },
                      child: const Text("تأكيد"))
                ],
              );
            }
          } else {
            return AlertDialog(
              title: const Text("data"),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).canPop();
                    },
                    child: const Text("تأكيد"))
              ],
            );
          }
        }
      },
    );
  }
}
