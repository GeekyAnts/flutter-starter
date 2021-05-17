import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class FoodItemGrid extends StatelessWidget {
  final List<Map> data;

  const FoodItemGrid({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(8),
      children: data
          .map(
            (item) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/product', arguments: {
                  'id': item['id'],
                  'name': item['name'],
                  'image': item['image'],
                });
              },
              child: Container(
                child: Stack(
                  children: [
                    Image.network(
                      item['image'],
                      fit: BoxFit.cover,
                      height: (MediaQuery.of(context).size.height).toHeight,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(left: 2),
                        height: 30.toHeight,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black45,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['name'],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
