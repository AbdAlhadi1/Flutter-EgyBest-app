import 'package:flutter/material.dart';

class DownloadTable extends StatelessWidget {
  const DownloadTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("الجودة",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("النوع",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("الحجم",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("التحميل",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("1080",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("WEB-DL",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: const Center(
                  child: Text("980.0 MB",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4.9,
                height: 50,
                child: Center(
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),
                    onPressed: (){

                    },
                    child: const Center(
                      child: Text("تحميل"),
                    )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
