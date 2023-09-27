import 'dart:convert';
import 'package:Mova/HomePage/Widget/Drawer_component.dart';
import 'package:Mova/HomePage/Widget/Most_view_section.dart';
import 'package:Mova/HomePage/Widget/get_home_page_section.dart';
import 'package:Mova/Log%20In/Screen/Log_In.dart';
import 'package:Mova/Log%20Out/log_out.dart';
import 'package:Mova/Main%20calsses/category.dart';
import 'package:Mova/Main%20calsses/home_page_sections.dart';
import 'package:Mova/Main%20calsses/mini_move.dart';
import 'package:Mova/Search/Screen/search_page.dart';
import 'package:Mova/Server/server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var user;
  bool isLoggedIn;
  List<Category> category;
  List<HomePageSection> homePageSection;
  HomePage({super.key,required this.homePageSection,required this.category,required this.isLoggedIn,this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<HomePageSection>> refreshHomePageMovies() async{
    try{
      Response response = await get(Uri.parse(Server.host+Server.homePageSection));
      if(response.statusCode == 200){
        print(response.statusCode);

        var info = jsonDecode(response.body);
        List infoLength = info;

        List<HomePageSection> homePageSections =[];

        for(int i=0;i<infoLength.length;i++){
          Category category = Category(
              info[i]["id"],
              info[i]["name"],
              info[i]["icon"]);

          var resultLength = info[i]["results"];
          int size = (resultLength.length?? 0);
          List<MiniMove> categoryMovies = [];
          for(int j=0;j<size;j++){
            MiniMove miniMove = MiniMove(
                info[i]["results"][j]["id"],
                info[i]["results"][j]["name"],
                info[i]["results"][j]["cityAndLanguage"],
                info[i]["results"][j]["movie_type"],
                info[i]["results"][j]["time"],
                info[i]["results"][j]["movies_image"],
                info[i]["results"][j]["movie_url"],
                info[i]["results"][j]["description"],
                info[i]["results"][j]["final_rate"],
                (info[i]["results"][j]["quality_id"]??0),
                info[i]["results"][j]["trailer_url"]);
            categoryMovies.add(miniMove);
          }
          HomePageSection homePageSection = HomePageSection(category, categoryMovies);
          homePageSections.add(homePageSection);
        }
        setState(() {
          widget.homePageSection = homePageSections;
        });
        return  homePageSections;

      }
      else {
        return[];
      }
    }catch(error){
      return[];
    }
  }
  bool isRed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.indigo
            ),

            backgroundColor: Colors.white,
            title: SizedBox(
              width: 100,
              height: 60,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>GetHomePageSection(isLoggedIn: widget.isLoggedIn)));
                },
                child: const Image(
                  image: AssetImage("images/logo2.png"),
                ),
              ),
            ),

            actions: [
              IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchPage(isLoggedIn: widget.isLoggedIn,)));
                },
                icon: const Icon(Icons.search,size: 35,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7,bottom: 7,right: 0,left: 14),
                child: SizedBox(
                  height:10 ,
                  width: 115,
                  child: (widget.isLoggedIn)?CupertinoButton(
                      color: Colors.indigo,
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogOut(user: widget.user,)));
                      },
                      child: Row(
                        children: [
                          const SizedBox(width:6),
                          const Icon(Icons.logout,size: 20,),
                          const SizedBox(width:6),
                          RichText(text: const TextSpan(
                              text: "تسجيل خروج",
                              style: TextStyle(
                                  fontSize: 14
                              )
                          )),
                        ],
                      )
                  ):CupertinoButton(
                    color: Colors.green,
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LogIn()));
                    },
                    child: Row(
                      children: [
                        const SizedBox(width:4),
                        const Icon(Icons.person,size: 20,),
                        const SizedBox(width:6),
                        RichText(text: const TextSpan(
                            text: "اشترك مجانا",
                            style: TextStyle(
                                fontSize: 14
                            )
                        )),
                      ],
                    )
                  ),
                ),
              ),

            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                for(int i=0;i<widget.category.length;i++)Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 7),
                      child: DrawerComponent(isLoggedIn: widget.isLoggedIn,category: widget.category[i]),
                    ),
                    Divider(color: Colors.black.withOpacity(0.5),),
                  ],
                ),
                Visibility(
                  visible: (widget.isLoggedIn)?true:false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 7),
                    child:InkWell(
                      onTap: (){
                        setState(() {
                          isRed = !isRed;
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogOut(user: widget.user,)));
                        setState(() {
                          isRed = !isRed;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Image(image: AssetImage("images/logout.png"),width: 35,height: 35,),
                          const SizedBox(width: 7,),
                          RichText(text: TextSpan(text: "تسجيل خروج",style: TextStyle(
                              color:  (isRed == true)?Colors.red:Colors.indigo,
                              fontSize: 18
                          ))),

                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible:(widget.isLoggedIn)?true:false,
                    child: Divider(color: Colors.black.withOpacity(0.5),)),

              ],
            ),
          ),

          body: LiquidPullToRefresh(
            onRefresh: refreshHomePageMovies,
            child: ListView(
                    children: [
                      const SizedBox(height: 10,),
                      // the home page sections components
                      // the most view move section
                      for(int i=0;i<widget.homePageSection.length; i++)Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 20),
                        child: HomePageSections(isLoggedIn: widget.isLoggedIn,title: widget.homePageSection[i].category.name, moviesList: widget.homePageSection[i].categoryMovies,categoryId: widget.homePageSection[i].category.id),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
