import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class Product extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  const Product({Key key, this.id, this.image, this.name}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int x;

  List<Map> products = [
    {
      'id': 1,
      'desc':
          'The Veg Whopper patty itself is vegan, with its main ingredients being soy, wheat, vegetable oil, herbs and onion and it will be served in a bun with mayonnaise.'
    },
    {
      'id': 2,
      'desc':
          'Finely chop the steak meat and combine with ground meat, salt and pepper. Like a donut, the patties sink to the bottom while they cook up crispy and brown until they eventually rise to the top to be lovingly ladled onto a bun to absorb just a little bit more of the seasoned oil. Even the cheese gets a brief dip in the grease to soften and flavor it.'
    },
    {
      'id': 3,
      'desc':
          'Pizza Margherita (more commonly known in English as Margherita pizza) is a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella cheese, fresh basil, salt and extra-virgin olive oil.'
    },
    {
      'id': 4,
      'desc':
          'This Italian Farmhouse Rustic Pizza is a complete meal on a pizza. Includes prosciutto, ricotta, roasted yellow peppers, basil, pistachios and balsamic vinegar. This is one of our specials.'
    },
  ];

  @override
  void initState() {
    super.initState();
    x = products.indexWhere((product) => product['id'] == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.toWidth),
                child: Text(
                  widget.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.toWidth),
                child: Text(
                  products[x]['desc'],
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 50.toHeight),
              Center(
                child: CustomButton(
                  text: "Order This",
                  onTap: () {
                    Navigator.pushNamed(context, '/bag', arguments: {
                      'id': widget.id,
                      'name': widget.name,
                      'image': widget.image,
                    });
                  },
                  isSecondary: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
