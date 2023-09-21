import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/mini_move.dart';
import 'package:egybest_app/Main%20calsses/movie_hero.dart';
import 'package:egybest_app/Main%20calsses/quality.dart';
import 'package:egybest_app/Main%20calsses/translation.dart';

class Movie{
  late MiniMove moveInfo;
  late Quality quality;
  late Translation translation;
  late List<Category> category;
  late List<MovieHero> movieHeroes;
  late List<MiniMove> relatedMovies;

  Movie(
      this.moveInfo,
      this.quality,
      this.translation,
      this.category,
      this.movieHeroes,
      this.relatedMovies
      );
}