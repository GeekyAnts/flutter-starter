import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bag",
          style: Theme.of(context).textTheme.headline4,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Card(
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
                    SizedBox(width: 20),
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
                        SizedBox(height: 10),
                        Text("Quantity:",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w400)),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).canvasColor,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(count.toString(),
                                style: Theme.of(context).textTheme.headline5),
                            SizedBox(width: 5),
                            SizedBox(
                              height: 30,
                              width: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).canvasColor,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.w600),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width / 1.5,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColorDark,
          child: Text(
            'Continue to payment',
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
      ),
    );
  }
}
