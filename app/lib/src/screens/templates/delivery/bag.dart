import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Bag extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  const Bag({Key key, this.id, this.image, this.name}) : super(key: key);

  @override
  _BagState createState() => _BagState();
}

class _BagState extends State<Bag> {
  int count = 1;
  double value = 1.21;

  changeCount(int x) {
    if ((count < 8 && x == 1) || (count > 1 && x == -1))
      setState(() {
        count += x;
        value = count * 1.21;
      });
  }

  //RazorPay Integration
  Razorpay _razorpay;
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_87KtddIT9mTM6P',
      'amount': 20 * 100,
      'name': 'Flutter Starter',
      'description': 'Delivery App',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.pushNamed(context, '/delivery');
    // print("Paymnent Success: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
    print("Paymnent Failed: " + response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
    print("Wallet Failure: " + response.walletName);
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
        title: Text('Bag'),
        centerTitle: false,
      ),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 25.toWidth, vertical: 15.toHeight),
        child: Column(
          children: [
            Card(
              elevation: 3,
              color: Colors.white,
              child: Container(
                height: 110,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                        SizedBox(width: 20.toWidth),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 20.toHeight),
                            Text(
                              "Quantity:",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 10.toHeight),
                            Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Theme.of(context).primaryColor,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      changeCount(1);
                                    },
                                    child: Text(
                                      '+',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.toWidth),
                                Text(count.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                SizedBox(width: 10.toWidth),
                                SizedBox(
                                  height: 30,
                                  width: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Theme.of(context).primaryColor,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      changeCount(-1);
                                    },
                                    child: Text(
                                      '-',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '\$' + value.toString().substring(0, 3),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.toWidth),
          child: CustomButton(
            text: "Continue to Payment",
            onTap: () {
              openCheckout();
            },
            isSecondary: false,
          ),
        ),
      ),
    );
  }
}
