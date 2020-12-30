import 'package:flutter/material.dart';
import 'package:shared/main.dart';
import 'package:app/src/screens/bookstore/book_details.dart';

class BookCard extends StatelessWidget {
  final BookStore bookStoreDetails;

  BookCard({@required this.bookStoreDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => BookDetails(bookDetails: bookStoreDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Column(
            children: <Widget>[
              Hero(
                tag: bookStoreDetails.id,
                child: Card(
                  elevation: 6,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/books/${bookStoreDetails.img}',
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(bookStoreDetails.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
              Text(
                'Author ${bookStoreDetails.author}',
                style: Theme.of(context).textTheme.overline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
