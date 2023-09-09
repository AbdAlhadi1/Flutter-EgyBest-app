import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){

        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
                height: 230,
                width: 150,
                child: Image(image: AssetImage("images/GOT.jpg"),fit: BoxFit.fill,)
            ),
            const SizedBox(height: 5,),
            RichText(text: const TextSpan(text: "GOT",style: TextStyle(
                color: Colors.indigo
            )))
          ],
        ),
      );
  }
}
