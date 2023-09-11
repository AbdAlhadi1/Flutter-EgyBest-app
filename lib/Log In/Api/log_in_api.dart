import 'dart:convert';

import 'package:egybest_app/Main%20calsses/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class LogInApi{

  Future saveUserData(var info) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("username", "");
    await pref.setString("email", "");
    await pref.setString("token", "");
    await pref.setInt("id", 0);
  }


  // log in function
  // in this function we pass the username and the password to the server
  // if the response was 200 and it all right we call the saveUserData function to save the user info in the local storage and return a user object
  // else we return an empty list

  Future<Tuple2<bool,List>> logIn (TextEditingController userNameController, TextEditingController passwordController) async{
    try{
      Response response = await post(Uri.parse(""),
        body: {
          "username":userNameController.text,
          "password":passwordController.text,
        }
      );
      if(response.statusCode == 200){
        var info = jsonDecode(response.body);
        User user = User("userName", "email", "token", 0);

        saveUserData(info);

        return Tuple2(true, [user]);
      } else {
        print (response.statusCode);
        print (jsonDecode(response.body));
        return const Tuple2(false, []);
      }
    }catch (error){
      print ("catch $error");
      return const Tuple2(false, []);
    }

  }

}