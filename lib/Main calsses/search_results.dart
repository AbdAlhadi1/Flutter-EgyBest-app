import 'package:egybest_app/Main%20calsses/mini_move.dart';

class SearchResultObject{
  late String nextUrl,previousUrl;
  late int count;
  late List<MiniMove> searchResult;
  SearchResultObject(
      this.count,
      this.nextUrl,
      this.previousUrl,
      this.searchResult
      );
}