
import 'package:Mova/Category/Widget/get_category_movies.dart';
import 'package:Mova/Main%20calsses/category.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerComponent extends StatefulWidget {
  bool isLoggedIn;
  Category category;
  DrawerComponent({super.key,required this.category,required this.isLoggedIn});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  bool isRed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isRed = !isRed;
        });
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GetCategoryMovies(isLoggedIn: widget.isLoggedIn,categoryId: widget.category.id)));
        setState(() {
          isRed = !isRed;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
         Image(image: NetworkImage(widget.category.icon),width: 35,height: 35,),
          const SizedBox(width: 7,),
          RichText(text: TextSpan(text: widget.category.name,style: TextStyle(
            color:  (isRed == true)?Colors.red:Colors.indigo,
            fontSize: 18
          ))),

        ],
      ),
    );
  }
}
