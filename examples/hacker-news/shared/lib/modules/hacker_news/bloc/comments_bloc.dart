import 'dart:core';

import 'package:rxdart/rxdart.dart';
import 'package:shared/modules/hacker_news/models/news_models_public.dart';

import '../resources/news_repository.dart';

class CommentsBloc {
  final _respository = Repository();
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<NewsItemModel>>>();

  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  //Sinks
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  //Streams
  get itemWithComments => _commentsOutput.stream;

  disponse() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }

  _commentsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<NewsItemModel>> cache, int id, index) {
        cache[id] = _respository.fetchItem(id);
        cache[id].then(
          (NewsItemModel item) {
            item.kids.forEach((kids) => fetchItemWithComments(kids));
          },
        );
        return cache;
      },
      <int, Future<NewsItemModel>>{},
    );
  }
}
