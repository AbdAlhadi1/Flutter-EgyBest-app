import 'dart:convert';
import 'package:Mova/HomePage/Widget/Movie_Item.dart';
import 'package:Mova/HomePage/Widget/get_home_page_section.dart';
import 'package:Mova/Log%20In/Screen/Log_In.dart';
import 'package:Mova/Log%20Out/log_out.dart';
import 'package:Mova/Main%20calsses/category.dart';
import 'package:Mova/Main%20calsses/category_page.dart';
import 'package:Mova/Main%20calsses/mini_move.dart';
import 'package:Mova/Search/Screen/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class CategoryMovies extends StatefulWidget {
  bool isLoggedIn;
  var user;
  List<CategoryPage> categoryPage;
  CategoryMovies({super.key,required this.categoryPage,required this.isLoggedIn,this.user});

  @override
  State<CategoryMovies> createState() => _CategoryMoviesState();
}

class _CategoryMoviesState extends State<CategoryMovies> {
  late List<MiniMove> categoryMovies ;//= widget.categoryPage[0].categoryMovies;
  bool isLoadingMore = false;
  late ScrollController scrollController;
  late String url; //= widget.categoryPage[0].nextPageUrl;

  Future loadeMore()async{
    if(isLoadingMore == false && url != ""){
      setState(() {
        isLoadingMore = true;
      });
      try{
        print("oppopop");
        Response response = await get(Uri.parse(url));
        if(response.statusCode == 200){
          //print(response.statusCode);
          var info = jsonDecode(response.body);
          Category category = Category(info["id"], info["name"], info["icon"]);
          List categoryMovieSize = info["related_movies"]["results"];
          List <MiniMove> categoryMoviess = [];
          for(int i=0;i<categoryMovieSize.length;i++){
            MiniMove miniMove = MiniMove(
                info["related_movies"]["results"][i]["id"],
                info["related_movies"]["results"][i]["name"],
                info["related_movies"]["results"][i]["cityAndLanguage"],
                info["related_movies"]["results"][i]["movie_type"],
                info["related_movies"]["results"][i]["time"],
                info["related_movies"]["results"][i]["movies_image"],
                info["related_movies"]["results"][i]["movie_url"],
                info["related_movies"]["results"][i]["description"],
                info["related_movies"]["results"][i]["final_rate"],
                info["related_movies"]["results"][i]["quality"],
                info["related_movies"]["results"][i]["trailer_url"]);
            categoryMoviess.add(miniMove);
          }
          CategoryPage categoryPage = CategoryPage(category, categoryMoviess, info["related_movies"]["count"], (info["related_movies"]["next"]??""), ( info["related_movies"]["previous"]??""));
          setState(() {
            url = categoryPage.nextPageUrl;
            categoryMovies += categoryPage.categoryMovies;
          });
        } else {

        }
      }catch(error){

      }
      setState(() {
        isLoadingMore = false;
      });
    }
  }
  @override
  void initState() {
    url = widget.categoryPage[0].nextPageUrl;
    categoryMovies = widget.categoryPage[0].categoryMovies;
    scrollController = ScrollController()..addListener(loadeMore);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          appBar:  AppBar(
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
          body:ListView(
              controller: scrollController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9.5,left: 9.5,top: 15),
                  child: Container(
                    color: Colors.white,
                    height: 50,
                    child: Center(
                      child: Text(widget.categoryPage[0].category.name,style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),),
                    ),
                  ),
                ),
                for(int i=0;i<categoryMovies.length;i++)Padding(
                  padding:(i == 0)? const EdgeInsets.only(bottom: 10,top :0):const EdgeInsets.only(bottom: 10,top :5),
                  child: Center(child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width - 20,
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7),
                      child: MovieItem(isLoggedIn: widget.isLoggedIn,movie: categoryMovies[i]),
                    ),
                  )),
                ),
                if(isLoadingMore == true)const Padding(padding: EdgeInsets.only(top: 10,bottom: 40),child: Center(child: CircularProgressIndicator(),),)

              ],
            ),
        ),
      ),
    );
  }
}
