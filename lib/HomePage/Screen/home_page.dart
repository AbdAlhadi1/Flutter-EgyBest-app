import 'package:egybest_app/HomePage/Widget/Drawer_component.dart';
import 'package:egybest_app/HomePage/Widget/Most_view_section.dart';
import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/home_page_sections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  List<Category> category;
  List<HomePageSection> homePageSection;
  HomePage({super.key,required this.homePageSection,required this.category});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            title: Row(
              children: [
                RichText(text:const TextSpan(text: "Best",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:Colors.indigo
                ))),
                RichText(text:const TextSpan(text: "Egy",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                )))
              ],
            ),

            actions: [
              IconButton(
                onPressed: (){

                },
                icon: const Icon(Icons.search,size: 35,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7,bottom: 7,right: 0,left: 14),
                child: SizedBox(
                  height:10 ,
                  width: 115,
                  child: CupertinoButton(
                    color: Colors.green,
                    padding: EdgeInsets.zero,
                    onPressed: (){

                    },
                    child: Row(
                      children: [
                        const SizedBox(width:4),
                        const Icon(Icons.person),
                        const SizedBox(width:4),
                        RichText(text: const TextSpan(
                            text: "اشترك مجانا",
                            style: TextStyle(
                                fontSize: 17
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
                      child: DrawerComponent(category: widget.category[i]),
                    ),
                    Divider(color: Colors.black.withOpacity(0.5),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7),
                  child:InkWell(
                    onTap: (){
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
                Divider(color: Colors.black.withOpacity(0.5),),

              ],
            ),
          ),

          body:  SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10,),

                  // the home page sections components
                  // the most view move section
                  for(int i=0;i<widget.homePageSection.length; i++)Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 20),
                    child: HomePageSections(title: widget.homePageSection[i].category.name, moviesList: widget.homePageSection[i].categoryMovies),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
