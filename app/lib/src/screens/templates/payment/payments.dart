import 'package:app/src/screens/templates/payment/widgets/other_payments_tile.dart';
import 'package:app/src/screens/templates/payment/widgets/recently_used_tile.dart';
import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/services.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool showCreditDebitCard = false;
  List<Map> recents = [
    {
      'id': 1,
      'opt': false,
      'text': 'abc@oksbi',
      'image':
          'https://www.searchpng.com/wp-content/uploads/2019/02/Google-Pay-Logo-Icon-PNG.png'
    },
    {
      'id': 2,
      'opt': false,
      'text': '87******47',
      'image':
          'https://www.searchpng.com/wp-content/uploads/2019/02/Google-Pay-Logo-Icon-PNG.png'
    }
  ];

  void toggleopt(int id) {
    for (int i = 0; i <= recents.length; i++) {
      if (id == recents[i]['id']) {
        setState(() {
          showCreditDebitCard = false;
          recents[i]['opt'] = !recents[i]['opt'];
        });
        break;
      }
    }
  }

  void toggleShowCreditDebitCard() {
    setState(() {
      showCreditDebitCard = !showCreditDebitCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.west),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment Method'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.toWidth,
            vertical: 40.toHeight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Recently Used",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: 10.toHeight),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recents.length,
                itemBuilder: (context, index) {
                  return RecentlyUsedTile(
                    id: recents[index]['id'],
                    opt: recents[index]['opt'],
                    text: recents[index]['text'],
                    image: recents[index]['image'],
                    toggleopt: toggleopt,
                  );
                },
              ),
              SizedBox(height: 40.toHeight),
              Text(
                "Other Payment Options",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: 20.toHeight),
              OtherPaymentTile(
                leadingIcon: Icons.payments,
                text: "Cash on Delivery ( Cash/Card/UPI )",
                actionIcon: Icons.expand_more,
              ),
              showCreditDebitCard
                  ? _creditCardTile(context)
                  : Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () => toggleShowCreditDebitCard(),
                        child: OtherPaymentTile(
                          leadingIcon: Icons.credit_card,
                          text: "Credit/Debit Card",
                          actionIcon: Icons.expand_more,
                        ),
                      ),
                    ),

              OtherPaymentTile(
                leadingIcon: Icons.account_balance,
                text: "Netbanking",
                actionIcon: Icons.expand_more,
              ),
              OtherPaymentTile(
                leadingIcon: Icons.account_balance_wallet,
                text: "Google pay/UPI/Phone pay/paytm",
                actionIcon: Icons.expand_more,
              )
              // RecentlyUsedTile(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.toWidth),
          child: CustomButton(
            text: "Continue",
            onTap: () {},
            isSecondary: false,
          ),
        ),
      ),
    );
  }

  Widget _creditCardTile(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15.toHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.toWidth,
        vertical: 30.toHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: InkWell(
              onTap: () => toggleShowCreditDebitCard(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.credit_card, color: Colors.grey[800], size: 18),
                  SizedBox(width: 12.toWidth),
                  Expanded(
                    child: Text(
                      "Credit/Debit Card",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 26.toFont),
                    ),
                  ),
                  SizedBox(width: 10.toWidth),
                  Icon(Icons.expand_more, color: Colors.grey[800], size: 18),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.toHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.radio_button_unchecked,
                color: Theme.of(context).accentColor.withOpacity(0.45),
                size: 15,
              ),
              SizedBox(width: 10.toWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ICICI Bank Debit Card 54340*******4014',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                    ),
                    Text(
                      'Lorem ipsum',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500],
                          ),
                    ),
                    Text(
                      'Expiration date 07/2024',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500],
                          ),
                    ),
                    SizedBox(height: 40.toHeight),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[500],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.toWidth),
                          child: Text(
                            "Or",
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[500],
                                    ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.toHeight),
                  ],
                ),
              ),
            ],
          ),
          TextField(
            inputFormatters: [
              MaskedTextInputFormatter(
                mask: 'xxxx xxxx xxxx xxxx',
                separator: ' ',
              ),
            ],
            keyboardType: TextInputType.number,
            autocorrect: false,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.grey[500],
                  fontSize: 28.toFont,
                ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Card Number',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey[500], fontSize: 22.toFont),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 30.toWidth, vertical: 8.toHeight),
              filled: false,
            ),
          ),
          SizedBox(height: 30.toHeight),
          TextField(
            maxLength: 15,
            keyboardType: TextInputType.text,
            autocorrect: false,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.grey[500],
                  fontSize: 28.toFont,
                ),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Name on card',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey[500], fontSize: 22.toFont),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 30.toWidth, vertical: 8.toHeight),
              filled: false,
            ),
          ),
          SizedBox(height: 30.toHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  textAlign: TextAlign.left,
                  inputFormatters: [
                    MaskedTextInputFormatter(mask: 'xx/xx', separator: '/')
                  ],
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.grey[500],
                        fontSize: 28.toFont,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Valid Thru(MM/YY)',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.grey[500], fontSize: 22.toFont),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 30.toWidth, vertical: 8.toHeight),
                    filled: false,
                  ),
                ),
              ),
              SizedBox(width: 20.toWidth),
              Flexible(
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  autocorrect: false,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.grey[500],
                        fontSize: 28.toFont,
                      ),
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'CVV',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.grey[500], fontSize: 22.toFont),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 30.toWidth, vertical: 8.toHeight),
                    filled: false,
                  ),
                ),
              ),
            ],
          )
        ],
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
