import 'dart:convert';
import 'package:Mova/Server/server.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class LogOutApi{

  Future <Tuple2<bool,List>> logOut (var user) async{
    try{
      Response response = await post(Uri.parse(Server.host+Server.logOut),headers: {
        "Authorization": 'token ${user.token}',
      });
      if(response.statusCode == 200){
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.clear();
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