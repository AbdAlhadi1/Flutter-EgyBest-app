import 'package:egybest_app/Log%20In/Screen/Log_In.dart';
import 'package:egybest_app/SIgn%20Up/Api/sign_up_api.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class SendSignUpData extends StatelessWidget {
  TextEditingController usernameController,emailController,passwordController,confirmPasswordController;
  SendSignUpData({super.key,required this.usernameController,required this.emailController,required this.passwordController,required this.confirmPasswordController});
  SignUpApi ob = SignUpApi();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ob.signUp(usernameController, emailController, passwordController, confirmPasswordController),
          builder: (context,AsyncSnapshot<Tuple2<bool,List>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            } else if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data!.item1 == true){
                return  AlertDialog(
                  title: const Text("تم تسجيل الحستب بنجاح الرجاء تفقد الايميل من اجل تثبيت الحساب"),
                  actions: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LogIn()));
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
                        Navigator.of(context).canPop();
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
