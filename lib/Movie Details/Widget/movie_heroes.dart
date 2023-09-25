import 'package:egybest_app/Main%20calsses/movie_hero.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieHeroes extends StatelessWidget {
  List<MovieHero> movieHeroes;
  MovieHeroes({super.key,required this.movieHeroes});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width - 15 ,
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30,top: 10,bottom: 0),
                child:Text("الابطال",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
              ),
            ],
          ),
          const Divider(),

          for(int i=0;i<movieHeroes.length;i++)Padding(
            padding:  EdgeInsets.only(right: 10,top: 5,bottom: 12),
            child: HeroItem(movieHero: movieHeroes[i]),
          ),

        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class HeroItem extends StatelessWidget {
  MovieHero  movieHero;
  HeroItem({super.key,required this.movieHero});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage:  NetworkImage(movieHero.heroImage),
          radius: 30,
        ),
        const SizedBox(width: 11,),
        Column(
          children: [
            RichText(text:  TextSpan(text: movieHero.heroFullName,style: const TextStyle(
              color: Colors.indigo,
            ))),
            RichText(text: TextSpan(text: movieHero.heroRoleName,style: const TextStyle(
              color: Colors.black26
            ))),
          ],
        )
      ],
    );
  }
}

