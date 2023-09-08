import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerComponent extends StatefulWidget {
  String title;
  IconData icon;
  DrawerComponent({super.key,required this.title,required this.icon});

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
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(widget.icon,color: (isRed == true)?Colors.red:Colors.indigo,size: 24,),
          const SizedBox(width: 7,),
          RichText(text: TextSpan(text: widget.title,style: TextStyle(
            color:  (isRed == true)?Colors.red:Colors.indigo,
            fontSize: 18
          ))),

        ],
      ),
    );
  }
}
