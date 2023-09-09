// ignore: file_names
import 'package:egybest_app/HomePage/Widget/Movie_Item.dart';
import 'package:flutter/material.dart';

class MostViewSection extends StatelessWidget {
  const MostViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    List movie = [
      const Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(child: MovieItem()),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(child: MovieItem()),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(child: MovieItem()),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(child: MovieItem()),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(child: MovieItem()),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(child: MovieItem()),
      ),
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 330,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: const TextSpan(text: "الافلام الاكثر مشاهدة",style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: (){

                    },
                    child: RichText(
                      text: const TextSpan(text: "المزيد", style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17
                        )),
                    ),),)],),
            SizedBox(
              height: 260,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                    for(int i=0;i<movie.length;i++)movie[i],
                  ],
                ),
            ),
          ],
        )
          /*ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context,i)=>const Padding(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: Center(child: MovieItem()),
            ))*/
      ),
    );
  }
}
