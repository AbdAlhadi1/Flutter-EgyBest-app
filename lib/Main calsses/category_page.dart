import 'package:egybest_app/Main%20calsses/category.dart';
import 'package:egybest_app/Main%20calsses/mini_move.dart';

class CategoryPage{
  late Category category;
  late int count;
  late String nextPageUrl,previous;
  late List<MiniMove> categoryMovies;
  CategoryPage(
      this.category,
      this.categoryMovies,
      this.count,
      this.nextPageUrl,
      this.previous,
      );

}