import 'package:flutter/material.dart';

class MovieStory extends StatelessWidget {
  const MovieStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      color: Colors.white,
      child:  Column(
        children: [
         const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30,top: 10,bottom: 10),
                child:Text("القصة",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35,top: 15,bottom: 15),
            child: RichText(text: const TextSpan(text: "انا هلوة كتييييييير كربوجة كامان شعراتي هلوين كتيييييييييير امامير بحب المتاعم كتير كتير باكل بيتزا وبشرب اسير",style: TextStyle(
              color: Colors.black,
              fontSize: 17,wordSpacing: 1
            ))),
          ),
        ],
      ),
    );
  }
}
