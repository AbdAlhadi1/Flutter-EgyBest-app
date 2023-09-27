
import 'package:Mova/HomePage/Widget/get_home_page_section.dart';
import 'package:Mova/Log%20In/Api/log_in_api.dart';
import 'package:Mova/Main%20calsses/user.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class CheckIfUserLoggedIn extends StatelessWidget {
  CheckIfUserLoggedIn({super.key});
  LogInApi ob = LogInApi();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ob.checkIfUserLoggedIn(),
          builder: (context,AsyncSnapshot<Tuple2<bool,User>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            } else if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data!.item1 == true){
                return GetHomePageSection(isLoggedIn: true, user: snapshot.data!.item2,);
              } else {
                return GetHomePageSection(isLoggedIn: false);
              }
            } else {
              return AlertDialog(
                title: const Text(""),
                actions: [
                  ElevatedButton(
                    onPressed: (){

                    },
                    child: const Text("رجوع"),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
