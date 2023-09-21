import 'package:egybest_app/Log%20In/Screen/Log_In.dart';
import 'package:egybest_app/Log%20Out/log_out_api.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    LogOutApi ob = LogOutApi();
    return FutureBuilder(
      future: ob.logOut(),
      builder: (context,AsyncSnapshot<Tuple2<bool,List>> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data!.item1 == true){
              return const LogIn();
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
