import 'package:flutter/material.dart';

class PhotoAndDownloadButton extends StatelessWidget {
  const PhotoAndDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40,bottom: 25),
          child: Center(
            child: SizedBox(
              height:420,
              width: 300,
              child: Image(image: AssetImage("images/GOT.jpg"),fit: BoxFit.fill,),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(right: 78,left: 78),
            backgroundColor: Colors.green,
          ),
          onPressed: (){

          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.download_for_offline),
              SizedBox(width: 7,),
              Text("مشاهدة وتحميل الفيلم"),
            ],
          ),
        )
      ],
    );
  }
}
