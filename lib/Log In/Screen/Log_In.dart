import 'package:Mova/Log%20In/Widget/send_log_in_data.dart';
import 'package:Mova/my_field.dart';
import 'package:flutter/material.dart';

import '../../SIgn Up/Screen/sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;

  bool formCheck (){
    var op = formKey.currentState;
    return op!.validate();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                       const Padding(
                        padding: EdgeInsets.only(top: 130,right: 50, left: 50),
                        child: Image(
                          image: AssetImage("images/logo2.png"),
                        )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/14,),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MyFild(
                              suffixIcon: const Icon(Icons.person),
                              contorller: userNameController,
                              hintText: "اسم المستخدم",
                              errorText: "",
                              obscure: false,
                              readOnly: false,
                              rightPadding: 20.0,
                              leftPadding: 20.0,
                              color: Colors.white,
                              sidesColor: Colors.black45,
                              val: (_){
                                if(userNameController.text.isEmpty){
                                  return "required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10,),
                            MyFild(
                                suffixIcon: IconButton(
                                   icon: Icon(_isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                   onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                   }),
                                contorller: passwordController,
                                hintText: "كلمة المرور",
                                obscure: _isPasswordVisible,
                                errorText: "",
                                readOnly: false,
                                rightPadding: 20.0,
                                leftPadding: 20.0,
                                color: Colors.white,
                                maxLine: 1,
                                sidesColor: Colors.black45,
                                val: (_){
                                  if(passwordController.text.isEmpty){
                                    return "required";
                                  } else {
                                    return null;
                                  }
                                }
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
                          backgroundColor: Colors.indigo[700],
                          animationDuration: const Duration(seconds: 3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                        ),
                        onPressed: (){
                          if(formCheck()){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SendLogInData(passwordController: passwordController, userNameController: userNameController)));
                          }
                        },
                        child: const Text("تسجيل دخول"),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUp()));
                              },
                              child:const Text("إنشاء حساب",style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
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
