import 'package:app/src/screens/templates/delivery/widgets/food_items_grid.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class DeliveryDashboard extends StatefulWidget {
  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard>
    with TickerProviderStateMixin {
  List<Map> burgers = [
    {
      'id': 1,
      'name': 'Veg Whooper',
      'image':
          'https://image.cnbcfm.com/api/v1/image/106322586-1578324793503bk_rebel_b_whopper_kv_0002_lightgreen.jpg?v=1578325001&w=1600&h=900',
    },
    {
      'id': 2,
      'name': 'Deep-Fried Burger',
      'image':
          'https://cdn.trendhunterstatic.com/thumbs/deep-fried-burger.jpeg',
    }
  ];
  List<Map> pizzas = [
    {
      'id': 3,
      'name': 'Margherita Pizza',
      'image':
          'https://www.dominos.co.in/blog/wp-content/uploads/2019/12/new_double_cheese_margherita.jpg'
    },
    {
      'id': 4,
      'name': 'Farmhouse Pizza',
      'image':
          'https://d4t7t8y8xqo0t.cloudfront.net/resized/720X280/group%2F107%2Fshutterstock_84904912.jpg'
    }
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "// You can have navigations to different sections here",
            ),
          ),
        ),
      ),
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Text('Delivery App'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 30.toHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.toWidth),
              child: Text(
                "Bolton Burgers &",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.toWidth),
              child: Text(
                "Pizza",
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
              ),
            ),
            SizedBox(height: 20.toHeight),
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Theme.of(context).accentColor,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lunch_dining,
                    size: 30,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.local_pizza,
                    size: 30,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FoodItemGrid(data: burgers),
                  FoodItemGrid(data: pizzas),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
