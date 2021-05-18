import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class ShowCards extends StatefulWidget {
  @override
  _ShowCardsState createState() => _ShowCardsState();
}

class _ShowCardsState extends State<ShowCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Saved Cards",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12.toHeight),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/add-card');
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: ListTile(
                    trailing: Icon(
                      Icons.chevron_right_outlined,
                      size: 30,
                    ),
                    title: Text(
                      "Add New Card",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Container(
                        height: (MediaQuery.of(context).size.height * 0.30)
                            .toHeight,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://www.logotaglines.com/wp-content/uploads/2016/08/ICICI-Logo-1200x1227.png',
                                      fit: BoxFit.cover,
                                      width: 30.toWidth,
                                    ),
                                    SizedBox(width: 10.toWidth),
                                    Text(
                                      'ICICI BANK',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ],
                                ),
                                Image.network(
                                  'https://lh3.googleusercontent.com/proxy/BWFN7yobpOM8azRu-gC_WxCPO6LEQa26r2GnlntGRnHVgPh15lPPoRh77vAd_Ta6jQkMRzass6udgREsgtHwEHij_d89z5HVZREJqnRQu7j2NWkRVEdgxzpgxvMSXaS1d7Hh2_3LFw4',
                                  width: 50.toWidth,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.toHeight),
                            Text(
                              'CARD NUMBER',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 5.toHeight),
                            Text('4377 51xx xxxx 1007'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.toHeight),
                                    Text(
                                      'NAME ON CARD',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 5.toHeight),
                                    Text('EXAMPLE NAME'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.toHeight),
                                    Text(
                                      'VALIDITY',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 5.toHeight),
                                    Text('XX/XX'),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10.toHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColorDark,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("EDIT"),
                                  ),
                                ),
                                SizedBox(width: 20.toWidth),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColorDark,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("REMOVE"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
