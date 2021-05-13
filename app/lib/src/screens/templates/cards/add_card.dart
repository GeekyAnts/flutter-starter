import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController cardNumber = new TextEditingController();
  TextEditingController nameOnCard = new TextEditingController();
  TextEditingController expiry = new TextEditingController();
  TextEditingController cvv = new TextEditingController();
  String cardNumberOnCard = "**** **** **** ****";
  String expiryOnCard = "**/**";
  String nameOfPerson = "Name of person";

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black54],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          'https://cdn.freebiesupply.com/logos/large/2x/chip-1-logo-png-transparent.png',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      cardNumberOnCard,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Expiry",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          expiryOnCard,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          nameOfPerson,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.length > 0)
                      nameOfPerson = value;
                    else
                      nameOfPerson = "Name of Person";
                  });
                },
                maxLength: 15,
                keyboardType: TextInputType.text,
                controller: nameOnCard,
                autofocus: true,
                autocorrect: false,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Name on card',
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    size: 25,
                  ),
                  filled: false,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.length > 0)
                      cardNumberOnCard = value;
                    else
                      cardNumberOnCard = "**** **** **** ****";
                  });
                },
                controller: cardNumber,
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: 'xxxx xxxx xxxx xxxx',
                    separator: ' ',
                  ),
                ],
                keyboardType: TextInputType.number,
                autocorrect: false,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Card Number',
                  prefixIcon: Icon(
                    Icons.credit_card_outlined,
                    size: 25,
                  ),
                  filled: false,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.length > 0)
                      expiryOnCard = value;
                    else
                      expiryOnCard = "**/**";
                  });
                },
                controller: expiry,
                keyboardType: TextInputType.number,
                autocorrect: false,
                textAlign: TextAlign.left,
                inputFormatters: [
                  MaskedTextInputFormatter(mask: 'xx/xx', separator: '/')
                ],
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Expiry Date (MM/YY)',
                  prefixIcon: Icon(
                    Icons.date_range,
                    size: 25,
                  ),
                  filled: false,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cvv,
                maxLength: 3,
                keyboardType: TextInputType.number,
                obscureText: true,
                autocorrect: false,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'CVV',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 25,
                  ),
                  filled: false,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    enableFeedback: true,
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorDark,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Text(
                    "Add Card",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
