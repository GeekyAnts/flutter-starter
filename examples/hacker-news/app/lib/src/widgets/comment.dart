import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';
import '../widgets/loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<NewsItemModel>> itemMap;
  final int dept;

  Comment({this.itemId, this.itemMap, this.dept});

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<NewsItemModel> snapShot) {
        if (!snapShot.hasData) {
          return LoadingContainer();
        }
        return buildComment(snapShot.data, context);
      },
    );
  }

  Widget buildComment(NewsItemModel item, BuildContext context) {
    final children = <Widget>[];
    children.add(
      ListTile(
        title: buildText(item, context),
        subtitle: item.by == ''
            ? Text('Deleted')
            : Text(
                item.by,
                style: Theme.of(context).textTheme.bodyText2,
              ),
        contentPadding: EdgeInsets.only(
          right: 16.0,
          left: (dept + 1) * 16.0,
        ),
      ),
    );
    children.add(Divider());
    item.kids.forEach((kidId) {
      children.add(Comment(
        itemId: kidId,
        itemMap: itemMap,
        dept: dept + 1,
      ));
    });
    return Column(
      children: children,
    );
  }

  Widget buildText(NewsItemModel item, BuildContext context) {
    final text = item.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '');
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
