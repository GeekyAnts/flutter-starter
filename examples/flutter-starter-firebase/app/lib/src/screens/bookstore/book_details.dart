import 'package:app/src/screens/bookstore/modify_books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

class BookDetails extends StatelessWidget {
  final BookStore bookDetails;

  BookDetails({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    final bookDetailsProvider = Provider.of<FirebaseCRUDoperations>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await bookDetailsProvider.removeBookStore(bookDetails.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModifyBooks(
                            bookStore: bookDetails,
                          )));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: bookDetails.id,
                child: Card(
                  color: Colors.transparent,
                  elevation: 6,
                  child: Image.asset(
                    'assets/books/${bookDetails.img}',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(bookDetails.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 32)),
              Text('${bookDetails.author}',
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(fontSize: 24))
            ],
          ),
        ),
      ),
    );
  }
}
