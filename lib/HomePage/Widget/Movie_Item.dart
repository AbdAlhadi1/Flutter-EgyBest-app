import 'package:egybest_app/Movie%20Details/Screen/movie_details.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MovieDetails()));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             SizedBox(
                height: 230,
                width: 170,
                child: Stack(
                    children:[
                      const Image(image: AssetImage("images/GOT.jpg"),fit: BoxFit.fill,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                            const Icon(Icons.star,color: Colors.yellow,size: 45,),
                            Positioned(
                                right: 14,
                                top: 16,
                                child: RichText(text: const TextSpan(text: "9.2",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                ))))
                          ],)
                      ],),
                        Padding(
                            padding: const EdgeInsets.only(top: 15,right: 90),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              //mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Transform.rotate(
                                  angle: -70,
                                  child:Transform.translate(
                                    offset: const Offset(4,4),
                                    child: Container(
                                        color: Colors.red,
                                        height: 20,
                                        width: 75,
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 7),
                                            child: Text("Blu-Ray",style: TextStyle(
                                              color: Colors.white
                                            ),),
                                          ),
                                        ),
                                      ),
                                  ),
                                )
                            ],),
                          ),
                ])
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