import 'package:shared/modules/hacker_news/models/news_models_public.dart';
import '../resources/resource_provider/news_api_provider.dart';
import '../resources/resource_provider/news_db_provider.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  Future<List<int>> fetchTopId() {
    return sources[1].fetchTopId();
  }

  Future<NewsItemModel> fetchItem(int id) async {
    NewsItemModel item;
    var source;

    for (source in sources) {
      item = await source.fetchItems(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      if (cache != source) {
        cache.addItem(item);
      }
    }

    return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopId();
  Future<NewsItemModel> fetchItems(int id);
}

abstract class Cache {
  Future<int> addItem(NewsItemModel item);
  Future<int> clear();
}
