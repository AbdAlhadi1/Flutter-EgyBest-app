import 'package:egybest_app/my_field.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
              children: [
                /*Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white,Colors.blueAccent,Colors.blue,Colors.indigo],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  ),
                ),*/
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children:[
                         /* const Center(
                            child:  SizedBox(
                              width: 200,
                              height: 200,
                              child: Image(image: AssetImage("images/logo1.png")),
                            ),
                          ),*/
                          //SizedBox(height: MediaQuery.of(context).size.height/20,),
                          Padding(
                            padding: const EdgeInsets.only(top: 160),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(text:  TextSpan(text: "Best",style: TextStyle(
                                  fontFamily: "Cairo",
                                  color: Colors.indigo[700],
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold
                              ))),
                              RichText(text:  TextSpan(text: "Egy",style: TextStyle(
                                color: Colors.red[600],
                                fontFamily: "Cairo",
                                fontSize: 60,
                                fontWeight: FontWeight.bold
                              ))),

                            ],
                        ),
                          ),]
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/14,),
                      MyFild(
                        contorller: userNameController,
                        hintText: "اسم المستخدم",
                        errorText: "",
                        obscure: false,
                        readOnly: false,
                        rightPadding: 20.0,
                        leftPadding: 20.0,
                        color: Colors.white,
                        sidesColor: Colors.black45),
                      const SizedBox(height: 10,),
                      MyFild(
                          contorller: userNameController,
                          hintText: "كلمة المرور",
                          obscure: false,
                          errorText: "",
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          color: Colors.white,
                          sidesColor: Colors.black45),

                      const SizedBox(height: 15,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
                          backgroundColor: Colors.indigo[700],
                          animationDuration: const Duration(seconds: 3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                        ),
                        onPressed: (){

                        },
                        child: Text("تسجيل دخول"),
                      ),
                      //const SizedBox(height: 20,),
                      const SizedBox(
                          height: 230,
                          width: 250,
                          child: Image(image: AssetImage("images/login.png"))),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("لا تمتلك حساب؟",style: TextStyle(
                              fontSize: 16
                            ),),
                            InkWell(
                              onTap: (){

                              },
                              child:const Text("إنشاء حساب",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                decoration: TextDecoration.underline
                              ),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            )
        ),
      ),
    );
  }
}
