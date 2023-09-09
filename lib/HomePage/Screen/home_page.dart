import 'package:egybest_app/HomePage/Widget/Drawer_component.dart';
import 'package:egybest_app/HomePage/Widget/Most_view_section.dart';
import 'package:egybest_app/HomePage/Widget/Movie_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7),
                  child: DrawerComponent(title: "الاكثر مشاهدة", icon: Icons.remove_red_eye),
                ),

                 Divider(color: Colors.black.withOpacity(0.5),),

                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7),
                  child: DrawerComponent(title: "محتويات مستعادة", icon: Icons.file_present_sharp),
                ),

                Divider(color: Colors.black.withOpacity(0.5),),

                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7),
                  child: DrawerComponent(title: "الافلام", icon: Icons.movie_creation_outlined),
                ),

                Divider(color: Colors.black.withOpacity(0.5),),

                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7),
                  child: DrawerComponent(title: "المسلسلات", icon: Icons.desktop_mac_rounded),
                ),

                Divider(color: Colors.black.withOpacity(0.5),),

                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7),
                  child: DrawerComponent(title: "مكتبتي", icon: Icons.my_library_books_sharp),
                ),

                Divider(color: Colors.black.withOpacity(0.5),),
              ],
            ),
          ),

          body: Column(
            mainAxisSize: MainAxisSize.min,
              children: const[
                SizedBox(height: 10,),
                MostViewSection()
              ],
            ),
        ),
      ),
    );
  }
}
