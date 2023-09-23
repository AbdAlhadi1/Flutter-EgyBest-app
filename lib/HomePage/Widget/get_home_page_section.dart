import 'package:egybest_app/HomePage/Api/home_page_api.dart';
import 'package:egybest_app/HomePage/Widget/get_cagetory.dart';
import 'package:egybest_app/Main%20calsses/home_page_sections.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
class GetHomePageSection extends StatelessWidget {
  const GetHomePageSection({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageApi ob = HomePageApi();
    return FutureBuilder(
        future: ob.getHomePageSection(),
        builder:(context,AsyncSnapshot<Tuple2<bool,List<HomePageSection>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          } else if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data!.item1 == true){
              return GetHomePageCategory(homePageSection: snapshot.data!.item2,);
            } else {
              return AlertDialog(
                title: const Text("data"),
                actions: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).canPop();
                  }, child: const Text("تأكيد"))
                ],
              );
            }
          } else {
            return AlertDialog(
              title: const Text("data"),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).canPop();
                }, child: const Text("تأكيد"))
              ],
            );
          }
        },
    );
  }
}

