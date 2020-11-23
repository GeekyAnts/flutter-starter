import 'package:api_sdk/main.dart';
import 'package:shared/modules/hacker_news/models/news_models_public.dart';
import '../news_repository.dart';

class NewsApiProvider implements Source {
  Future<List<int>> fetchTopId() async {
    final response = await ApiSdk.fetchTopId();
    final ids = response;
    return ids.cast<int>();
  }

  Future<NewsItemModel> fetchItems(int id) async {
    final response = await ApiSdk.fetchItems(id);
    final parsedJson = response;
    return NewsItemModel.fromJson(parsedJson);
  }
}
