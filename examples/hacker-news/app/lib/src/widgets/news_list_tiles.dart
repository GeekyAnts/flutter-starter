import 'package:app/src/screens/news_screens/news_details.dart';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';
import '../widgets/loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<NewsItemModel>>> snapShot) {
        if (!snapShot.hasData) {
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapShot.data[itemId],
          builder: (context, AsyncSnapshot<NewsItemModel> itemShapShot) {
            if (!itemShapShot.hasData) {
              return LoadingContainer();
            }
            return buildList(context, itemShapShot.data);
          },
        );
      },
    );
  }

  Widget buildList(BuildContext context, NewsItemModel item) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CommentsProvider(
                          child: NewsDetail(
                            itemId: item.id,
                          ),
                        )));
          },
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: Text(
            '${item.score} points',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.comment,
                size: 24,
                color: Theme.of(context).buttonColor,
              ),
              Text(
                '${item.descendants}',
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
        Divider(
          height: 10.0,
        )
      ],
    );
  }
}
