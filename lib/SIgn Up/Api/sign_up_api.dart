import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

import '../../Server/server.dart';

class SignUpApi{
  // Sign Up function
  // in this function we pass the user info and send it to the server
  // if it all right and the response was 200 we teleport the user to the log in page

  Future<Tuple2<bool,List>> signUp(TextEditingController usernameController,TextEditingController emailController, TextEditingController passwordController , TextEditingController confirmPasswordController) async {

    try{

      Response response = await post(Uri.parse(Server.host+Server.register),
        body: {
          "email": emailController.text,
          "username": usernameController.text,
          "password":passwordController.text,
          "password2":confirmPasswordController.text,
        }
      );
      if(response.statusCode == 200){
        print(jsonDecode(response.body));
        return const Tuple2(true, []);
      }else{
        print(response.statusCode);
        print(jsonDecode(response.body));
        var info = jsonDecode(response.body);
        String emailError = info["email"][0];
        String usernameError = info["username"];

        return const Tuple2(false, []);
      }

    }catch(e){
      print (e);
      return const Tuple2(false, []);
    }

  }


}