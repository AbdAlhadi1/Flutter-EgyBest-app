import 'package:egybest_app/HomePage/Screen/home_page.dart';
import 'package:egybest_app/Log%20In/Screen/Log_In.dart';
import 'package:egybest_app/SIgn%20Up/Widget/send_signup_data.dart';
import 'package:egybest_app/my_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkForm (){
    var op = formKey.currentState;
    return op!.validate();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/5,),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyFild(
                        contorller: usernameController,
                        errorText: "",
                        hintText: "اسم المستخدم",
                        obscure: false,
                        readOnly: false,
                        rightPadding: 20.0,
                        leftPadding: 20.0,
                        color: Colors.white,
                        sidesColor: Colors.black45,
                        val: (_){
                          if(usernameController.text.isEmpty){
                            return "required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 3,),
                      MyFild(
                          contorller: emailController,
                          errorText: "",
                          hintText: "البريد الالكتروني",
                          obscure: false,
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          color: Colors.white,
                          sidesColor: Colors.black45,
                          val: (_){
                            if(emailController.text.isEmpty){
                              return "required";
                            } else {
                              if(EmailValidator.validate(emailController.text)){
                                return null ;
                              } else {
                                return "invalid email";
                              }
                            }
                          }
                      ),
                      const SizedBox(height: 3,),
                      MyFild(
                          contorller: passwordController,
                          errorText: "",
                          hintText: "كلمة المرور",
                          obscure: false,
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          color: Colors.white,
                          sidesColor: Colors.black45,
                          val: (_){
                            if(passwordController.text.isEmpty){
                              return "required";
                            } else {
                              if(passwordController.text.length < 8){
                                return "required minimum 8 characters";
                              } else {
                                return null;
                              }
                            }
                          },
                      ),
                      const SizedBox(height: 3,),
                      MyFild(
                          contorller: confirmPasswordController,
                          errorText: "",
                          hintText: "تاكيد كلمة المرور",
                          obscure: false,
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          color: Colors.white,
                          sidesColor: Colors.black45,
                          val: (_){
                            if(confirmPasswordController.text.isEmpty){
                              return "required";
                            } else {
                              if(passwordController.text == confirmPasswordController.text){
                                return null;
                              } else {
                                return "not matching";
                              }
                            }
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[700],
                      padding: const EdgeInsets.only(left: 60,right: 60,top: 5,bottom: 5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: (){
                      if(checkForm()){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SendSignUpData(usernameController: usernameController, emailController: emailController, passwordController: passwordController, confirmPasswordController: confirmPasswordController)));
                      }
                    },
                    child: const Text("انشاء حساب",style: TextStyle(
                      fontSize: 17
                  ),)
                ),
                  SizedBox(height: (3*(MediaQuery.of(context).padding.top +
                     MediaQuery.of(context).padding.bottom +
                     AppBar().preferredSize.height))-10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: const TextSpan(text: "لديك حساب مسبقا؟ ",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ))),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LogIn()));
                      },
                       child: RichText(text: const TextSpan(text: "تسجيل دخول",style: TextStyle(
                         color: Colors.black,
                         fontSize: 16,
                         fontWeight: FontWeight.w600,
                         //decoration: TextDecoration.underline
                       )),),
                    )
                  ],
                )
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
