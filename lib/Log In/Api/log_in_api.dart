import 'dart:convert';
import 'package:Mova/Main%20calsses/user.dart';
import 'package:Mova/Server/server.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class LogInApi{

  // if the log in process complete we take the user information and save it in the local storage
  // we use shared preference to save it and call this function inside the log in function

  Future saveUserData(var info) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("username", info["user_info"]["username"]);
    await pref.setString("email", info["user_info"]["email"]);
    await pref.setString("token", info["token"][0]);
    await pref.setInt("id", info["user_info"]["id"]);
  }


  // log in function
  // in this function we pass the username and the password to the server
  // if the response was 200 and it all right we call the saveUserData function to save the user info in the local storage and return a user object
  // else we return an empty list

  Future<Tuple2<bool,List>> logIn (TextEditingController userNameController, TextEditingController passwordController) async{
    try{
      Response response = await post(Uri.parse(Server.host+Server.login),
        body: {
          "username":userNameController.text,
          "password":passwordController.text,
        }
      );
      if(response.statusCode == 200){
        var info = jsonDecode(response.body);
        print (info);
        User user = User(
          info["user_info"]["username"],
          info["user_info"]["email"],
          info["token"][0],
          info["user_info"]["id"]
        );
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


  Future<Tuple2<bool,User>> checkIfUserLoggedIn()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userName,email,token;
    int id;
    userName = (pref.getString("username") ?? "");
    email = (pref.getString("email") ?? "");
    token = (pref.getString("token") ?? "");
    id = (pref.getInt("id") ?? 0);
    User user = User(userName, email, token, id);
    if(userName == "" || email == "" || token == "" || id == 0){
      return Tuple2(false, user);
    } else {
      return Tuple2(true, user);
    }
  }

}