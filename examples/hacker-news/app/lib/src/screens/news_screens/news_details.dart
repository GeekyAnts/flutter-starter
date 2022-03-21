import 'package:app/src/widgets/comment.dart';
import 'package:app/src/widgets/web_view_details.dart';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';

class NewsDetail extends StatefulWidget {
  final int itemId;

  NewsDetail({this.itemId});

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail>
    with SingleTickerProviderStateMixin {
  bool isWebview = false;
  AnimationController _animationController;

  Widget build(BuildContext context) {
    final commentsBloc = CommentsProvider.of(context);
    commentsBloc.fetchItemWithComments(widget.itemId);
    return Scaffold(
      body: buildBody(commentsBloc),
      appBar: AppBar(
        title: Text(
          'Detail',
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
        actions: [
          IconButton(
            iconSize: 34,
            splashColor: Colors.greenAccent,
            icon: AnimatedIcon(
              icon: AnimatedIcons.list_view,
              progress: _animationController,
            ),
            onPressed: () => _handleOnPressed(),
          ),
        ],
      ),
    );
  }

  Widget buildBody(CommentsBloc commentsBloc) {
    return StreamBuilder(
      stream: commentsBloc.itemWithComments,
      builder:
          (context, AsyncSnapshot<Map<int, Future<NewsItemModel>>> snapShot) {
        if (!snapShot.hasData) {
          return Text('Loading!');
        }

        final itemFuture = snapShot.data[widget.itemId];
        return FutureBuilder(
          future: itemFuture,
          builder: (context, AsyncSnapshot<NewsItemModel> itemSnapShot) {
            if (!itemSnapShot.hasData) {
              return Text('No data!');
            }
            return isWebview
                ? WebViewDetails(url: itemSnapShot.data.url)
                : buildList(itemSnapShot.data, snapShot.data);
          },
        );
      },
    );
  }

  Widget buildList(
      NewsItemModel item, Map<int, Future<NewsItemModel>> itemMap) {
    final children = <Widget>[];
    children.add(buildTitle(item));
    final commentList = item.kids.map((kidsId) {
      return Comment(
        itemId: kidsId,
        itemMap: itemMap,
        dept: 0,
      );
    }).toList();
    children.addAll(commentList);

    return ListView(
      children: children,
    );
  }

  Widget buildTitle(NewsItemModel item) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10.0),
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  void _handleOnPressed() {
    setState(() {
      isWebview = !isWebview;
      isWebview
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}
