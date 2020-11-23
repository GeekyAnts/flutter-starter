import 'package:app/src/widgets/news_list_tiles.dart';
import 'package:app/src/widgets/refresh.dart';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';

class NewsList extends StatelessWidget {
  Widget build(BuildContext context) {
    final storiesBloc = StoriesProvider.of(context);
    storiesBloc.fetchTopIds();
    return topIdList(storiesBloc);
  }

  Widget topIdList(StoriesBloc storiesBloc) {
    return StreamBuilder(
      stream: storiesBloc.topId,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapShot) {
        if (!snapShot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Refresh(
          child: ListView.builder(
            itemCount: snapShot.data.length,
            itemBuilder: (BuildContext context, int index) {
              storiesBloc.fetchItem(snapShot.data[index]);
              return NewsListTile(itemId: snapShot.data[index]);
            },
          ),
        );
      },
    );
  }
}
