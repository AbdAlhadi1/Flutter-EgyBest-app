import 'dart:convert';

import 'package:egybest_app/Server/server.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class LogOutApi{

  Future <Tuple2<bool,List>> logOut () async{
    try{
      Response response = await post(Uri.parse(Server.host+Server.logOut));
      if(response.statusCode == 200){
        return const Tuple2(true, []);
      } else {
        print(response.statusCode);
        print (jsonDecode(response.body));
        return const Tuple2(false, []);
      }
    } catch(error){
      print (error);
      return const Tuple2(false, []);
    }
  }
}