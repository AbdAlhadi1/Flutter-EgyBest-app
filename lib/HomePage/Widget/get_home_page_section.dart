
import 'package:Mova/HomePage/Api/home_page_api.dart';
import 'package:Mova/HomePage/Widget/get_cagetory.dart';
import 'package:Mova/Main%20calsses/home_page_sections.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
class GetHomePageSection extends StatelessWidget {
  bool isLoggedIn;
  var user;
  GetHomePageSection({super.key,required this.isLoggedIn,this.user});

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
              return(isLoggedIn)?GetHomePageCategory(homePageSection: snapshot.data!.item2,isLoggedIn: isLoggedIn,user: user,): GetHomePageCategory(homePageSection: snapshot.data!.item2,isLoggedIn: isLoggedIn,);
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

