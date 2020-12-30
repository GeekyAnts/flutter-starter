import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

class AddBooks extends StatefulWidget {
  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  final _formKey = GlobalKey<FormState>();
  String bookType = 'Pulp Fiction';
  String title;
  String author;

  @override
  Widget build(BuildContext context) {
    var bookstoreProvider = Provider.of<FirebaseCRUDoperations>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Books'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Book Title',
                        filled: true,
                        isDense: true,
                      ),
                      autocorrect: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Book Title';
                        }
                        return null;
                      },
                      onSaved: (value) => title = value),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Author',
                        filled: true,
                        isDense: true,
                      ),
                      autocorrect: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter The author';
                        }
                        return null;
                      },
                      onSaved: (value) => author = value),
                  SizedBox(
                    height: 16,
                  ),
                  DropdownButton<String>(
                    iconSize: 24,
                    value: bookType,
                    onChanged: (String newValue) {
                      setState(() {
                        bookType = newValue;
                      });
                    },
                    items: <String>[
                      'Pulp Fiction',
                      'Love is a dog from hell',
                      'Kafka on the shore',
                      'Norwegian',
                      'Women'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  await bookstoreProvider.addBookStore(BookStore(
                      name: title,
                      author: author,
                      img:
                          '${bookType.replaceAll(' ', '').toLowerCase()}.jpg'));
                  Navigator.pop(context);
                } else {
                  print('no Validate');
                }
              },
              child: Text('Add book'),
            ),
          )
        ],
      ),
    );
  }
}
