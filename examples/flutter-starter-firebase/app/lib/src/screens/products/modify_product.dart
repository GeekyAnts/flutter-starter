import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/products/models/product_model.dart';

class ModifyProduct extends StatefulWidget {
  final Product product;

  ModifyProduct({@required this.product});

  @override
  _ModifyProductState createState() => _ModifyProductState();
}

class _ModifyProductState extends State<ModifyProduct> {
  final _formKey = GlobalKey<FormState>();

  String productType;

  String title;

  String price;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FirebaseCRUDoperations>(context);
    productType =
        widget.product.img[0].toUpperCase() + widget.product.img.substring(1);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modify Product Details'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.product.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Product Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Product Title';
                    }
                    return '';
                  },
                  onSaved: (value) => title = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.product.price,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                    return '';
                  },
                  onSaved: (value) => price = value),
              DropdownButton<String>(
                value: productType,
                onChanged: (String newValue) {
                  setState(() {
                    productType = newValue;
                  });
                },
                items: <String>['Bag', 'Computer', 'Dress', 'Phone', 'Shoes']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  // if (_formKey.currentState.validate()) {
                  //   _formKey.currentState.save();
                  print('save');
                  await productProvider.updateProduct(
                      Product(
                          name: title,
                          price: price,
                          img: productType.toLowerCase()),
                      widget.product.id);
                  Navigator.pop(context);
                  // }
                },
                child: Text('Modify Product',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
