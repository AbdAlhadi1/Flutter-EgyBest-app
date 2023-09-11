import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class SignUpApi{

  Future<Tuple2<bool,List>> signUp(TextEditingController usernameController,TextEditingController emailController, TextEditingController passwordController , TextEditingController confirmPasswordController) async {

    try{

      Response response = await post(Uri.parse("uri"),
        body: {
          "email": emailController.text,
          "username": usernameController.text,
          "password":passwordController.text,
          "confirm_password":confirmPasswordController.text,
        }
      );
      if(response.statusCode == 200){
        return const Tuple2(true, []);
      }else{
        print(response.statusCode);
        print(jsonDecode(response.body));
        return const Tuple2(false, ["error"]);
      }

    }catch(e){
      print (e);
      return const Tuple2(false, []);
    }

  }


}