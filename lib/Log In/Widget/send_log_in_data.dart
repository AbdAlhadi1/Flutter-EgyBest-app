import 'package:egybest_app/HomePage/Screen/home_page.dart';
import 'package:egybest_app/HomePage/Widget/get_home_page_section.dart';
import 'package:egybest_app/Log%20In/Api/log_in_api.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class SendLogInData extends StatelessWidget {
  TextEditingController userNameController,passwordController;
  SendLogInData({super.key,required this.passwordController,required this.userNameController});
  LogInApi ob = LogInApi();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ob.logIn(userNameController, passwordController),
          builder: (context,AsyncSnapshot<Tuple2<bool,List>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            } else if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data!.item1 == true){
                return const GetHomePageSection();
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
