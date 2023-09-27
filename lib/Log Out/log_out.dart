
import 'package:Mova/Log%20In/Widget/check_if_user_logged_in.dart';
import 'package:Mova/Log%20Out/log_out_api.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class LogOut extends StatelessWidget {
  var user;
  LogOut({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    LogOutApi ob = LogOutApi();
    return FutureBuilder(
      future: ob.logOut(user),
      builder: (context,AsyncSnapshot<Tuple2<bool,List>> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data!.item1 == true){
              return AlertDialog(
                title: const Text("تم تسجيل الخروج بنجاح"),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheckIfUserLoggedIn()));
                    },
                    child: const Text("تأكيد"),
                  )
                ],
              );
            } else {
              return AlertDialog(
                title: const Text(""),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text("تأكيد"),
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
                    Navigator.of(context).canPop();
                  },
                  child: const Text("تأكيد"),
                )
              ],
            );
          }
        }
      });
  }
}
