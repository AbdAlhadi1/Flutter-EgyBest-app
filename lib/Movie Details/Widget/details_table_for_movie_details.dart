import 'package:Mova/Main%20calsses/movie.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsTable extends StatelessWidget {
  Movie? movie;
  DetailsTable({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30,top: 10,bottom: 10,),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: movie!.moveInfo.movieName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.start),
              ],
            ),
          ),
          //const Sized
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
                  //color: Colors.red,
                  width: 100,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: " اللغة ",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: RichText(
                            text: const TextSpan(
                                text: ".",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800))),
                      ),
                      RichText(
                          text: const TextSpan(
                              text: " البلد ",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.moveInfo.cityAndLanguage,style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "التصنيف",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
               for(int i=0;i<movie!.category.length;i++) Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.category[i].name,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "النوع",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.moveInfo.movieType,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
          const Divider(),
           Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
               const SizedBox(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "التقييم",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.moveInfo.finalRate.toString(),style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "المدة",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.moveInfo.time,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding:const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "الجودة",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.quality.highestQuality,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
          const Divider(),
           Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "الترجمة",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
               const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: RichText(text: TextSpan(text: movie!.translation.translation,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
