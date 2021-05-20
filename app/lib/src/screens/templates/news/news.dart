import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredTile> _cardTile = <StaggeredTile>[
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
];

List<Widget> _listTile = <Widget>[
  BackGroundTile(
    id: 1,
    backgroundColor: Colors.deepPurpleAccent,
    data:
        'Delhi hospital sees increase in deadly fungal infection among Covid-19 patients',
  ),
  BackGroundTile(
    id: 2,
    backgroundColor: Colors.orange,
    data: 'Underworld don Chhota Rajan succumbs to COVID-19 at Delhi AIIMS',
  ),
  BackGroundTile(
    id: 3,
    backgroundColor: Colors.pink,
    data:
        'If we take strong measures, third Covid-19 wave may not happen, says Govt’s Scientific Advisor',
  ),
  BackGroundTile(
    id: 4,
    backgroundColor: Colors.green,
    data: 'CoWIN portal gets new security code feature after user complaints',
  ),
  BackGroundTile(
    id: 5,
    backgroundColor: Colors.blue,
    data:
        'Kumbh Mela Shahi Snans Biggest Super-Spreaders in Pandemic’s History: Dr Ashish Jha',
  ),
  BackGroundTile(
    id: 6,
    backgroundColor: Colors.red,
    data: 'Govt moves SC against Karnataka HC order on Oxygen',
  ),
];

// ignore: must_be_immutable
class News extends StatelessWidget {
  List<Map> news = [
    {
      'title': 'Weekly Newsletter #101',
      'newsletter':
          "If opportunity doesn't knock, build a door – Milton Berle All About This Week :face_with_monocle arrow_right:  Meetup Announcement! :meetup: We are back with our 2nd React & React Native Remote Meetup of 2021! Grab the opportunity to take the stage & share your thoughts on React or React Native with fellow developers. Event date & time : 8th May, 2021 at 12 PM IST Fill the CFP here.  :arrow_right: Our New Clients :star-struck: We are happy to share the list of our new clients - GetVital, Bukukas, Safexpay, DiscoverFin & Let’s play! New projects, new ideas...are you all excited?? :arrow_right:  Articles This Week! :writing_hand::skin-tone-2: MVP: A cost effective approach for App Development - By Siri Kaliparambil Improve Web App Performance Using Lighthouse - By Mohit Kumar AWS Amplify for Flutter - Part 1 - By Viral SanganiMozilla DeepSpeech engine in Flutter using Dart FFI - By Manuinder Sekhon"
    },
    {'title': 'Weekly Newsletter #102'},
    {'title': 'Weekly Newsletter #103'},
    {'title': 'Weekly Newsletter #104'},
    {'title': 'Weekly Newsletter #105'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 60, 15, 20),
        color: Colors.white,
        width: double.infinity,
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _cardTile,
          children: _listTile,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final int id;
  final Color backgroundColor;
  final String data;

  BackGroundTile({this.backgroundColor, this.data, this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/view-news',
            arguments: {'id': id, 'title': data});
      },
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
