
import 'package:Mova/Log%20In/Screen/Log_In.dart';
import 'package:Mova/SIgn%20Up/Widget/send_signup_data.dart';
import 'package:Mova/my_field.dart';
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
  bool _isPasswordVisible = true;
  bool _isPasswordVisible1 = true;

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
                //SizedBox(height: MediaQuery.of(context).size.height/5,),
                const Padding(
                    padding: EdgeInsets.only(top: 20,right: 50, left: 50),
                    child: Image(
                      image: AssetImage("images/logo2.png"),
                    )
                ),
                const SizedBox(height: 20,),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyFild(
                        suffixIcon: const Icon(Icons.person),
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
                          suffixIcon: const Icon(Icons.email),
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
                          errorText: "",
                          hintText: "كلمة المرور",
                          obscure: _isPasswordVisible,
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
                        suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible1 = !_isPasswordVisible1;
                              });
                            }),
                          contorller: confirmPasswordController,
                          errorText: "",
                          hintText: "تاكيد كلمة المرور",
                          obscure: _isPasswordVisible1,
                          readOnly: false,
                          rightPadding: 20.0,
                          leftPadding: 20.0,
                          color: Colors.white,
                          maxLine: 1,
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
                  /*SizedBox(height: (3*(MediaQuery.of(context).padding.top +
                     MediaQuery.of(context).padding.bottom +
                     AppBar().preferredSize.height)),),*/
                const SizedBox(
                    height: 230,
                    width: 250,
                    child: Image(image: AssetImage("images/login.png"))),
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
