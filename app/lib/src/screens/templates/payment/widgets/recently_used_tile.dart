import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class RecentlyUsedTile extends StatelessWidget {
  final int id;
  final bool opt;
  final String text;
  final String image;
  final Function toggleopt;

  const RecentlyUsedTile(
      {Key key, this.opt, this.text, this.image, this.toggleopt, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InkWell(
        onTap: () => toggleopt(id),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 15.toHeight,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 30.toWidth,
            vertical: 10.toHeight,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              opt == true
                  ? Icon(
                      Icons.radio_button_checked,
                      color: Theme.of(context).accentColor.withOpacity(0.55),
                      size: 18,
                    )
                  : Icon(Icons.radio_button_unchecked,
                      color: Theme.of(context).accentColor.withOpacity(0.55),
                      size: 18),
              SizedBox(width: 12.toWidth),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 26.toFont),
                ),
              ),
              SizedBox(width: 10.toWidth),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.network(
                  image,
                  width: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
