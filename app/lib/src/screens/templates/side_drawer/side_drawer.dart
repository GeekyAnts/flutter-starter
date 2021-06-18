import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  List<Map> items = [
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Home', 'icon': Icons.home},
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Text('Drawer'),
        centerTitle: false,
      ),
      body: Center(
        child: Text("Custom Drawer Template"),
      ),
      drawer: Drawer(
        elevation: 5,
        child: Container(
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _head(context),
                _lists(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _head(context) => Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.26,
        padding:
            EdgeInsets.symmetric(horizontal: 40.toWidth, vertical: 10.toHeight),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://i2.wp.com/www.aag.co.uk/wp-content/uploads/2014/06/Stuart-e1481116612125.jpg?ssl=1&resize=370,420&quality=80)',
                    ),
                  ),
                ),
              ),
              Spacer(flex: 4),
              Text(
                "Stuart Hudson",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 28.toFont,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Spacer(flex: 1),
              Text(
                "stuarthudson@gmail.com",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 23.toFont,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        ),
      );

  Widget _lists(context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 20.toWidth, vertical: 20.toHeight),
              child: Text(
                "Options:",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: (selectedIndex == index)
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    child: ListTile(
                      leading: Icon(
                        items[index]['icon'],
                        size: 25,
                        color: (selectedIndex == index)
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                      title: Text(items[index]['name'],
                          style: TextStyle(
                            color: (selectedIndex == index)
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            fontSize: 25.toFont,
                          )),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      trailing: Icon(
                        Icons.chevron_right_outlined,
                        size: 25,
                        color: (selectedIndex == index)
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
