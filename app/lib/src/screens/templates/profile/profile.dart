import 'package:app/src/config/image_constants.dart';
import 'package:app/src/screens/templates/profile/widgets/tile.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
            25.toWidth, 60.toHeight, 25.toWidth, 20.toHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height * 0.20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Hi, ',
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                        children: [
                          TextSpan(
                            text: "Tynan Wenarchuk",
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedImage(
                      imageUrl:
                          "https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Tynan-Allan.jpeg",
                      fit: BoxFit.cover,
                      errorWidget: Image.network(
                        AllImages().kDefaultImage,
                      ),
                      width: 120,
                      height: 120,
                      placeholder: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height * 0.55).toHeight,
              child: Column(
                children: [
                  SizedBox(height: 30.toHeight),
                  Tile(icon: Icons.public, text: "Eat, sleep, create"),
                  Tile(icon: Icons.phone, text: "9999945123"),
                  Tile(icon: Icons.event, text: "22/01/1995"),
                  Tile(icon: Icons.email, text: "abcd@hotmail.com"),
                ],
              ),
            ),
            Center(
              child: CustomButton(
                isSecondary: false,
                onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                text: "Edit Profile",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
