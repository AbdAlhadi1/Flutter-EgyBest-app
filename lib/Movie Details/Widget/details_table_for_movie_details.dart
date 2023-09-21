import 'package:flutter/material.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({super.key});

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
                    text: const TextSpan(
                        text: "GOT",
                        style: TextStyle(
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
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
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
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
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
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
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
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
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
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
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
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SizedBox(
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
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
