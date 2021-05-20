import 'package:flutter/material.dart';

List<Map> news = [
  {
    'id': 1,
    'news':
        "A city hospital has reported an increase in the number of cases of a rare fungal infection triggered by the Coronavirus disease (Covid-19) as the cases of the viral infection has increased exponentially in the city. Six patients with the rare infection mucormycosis were admitted to Sir Ganga Ram hospital over the last two days. In December last year, the hospital had seen 10 cases of the fungal infection in patients with Covid-19 or those who had recently recovered from it in a period of fifteen days. If not detected early, the infection – Mucormycosis also known as black fungus – can kill half the patients. Others might lose eye-sight or have to get their jaw bones removed if the infection spreads."
  },
  {
    'id': 2,
    'news':
        "NEW DELHI: Underworld don Chhota Rajan succumbed to the deadly COVID-19 infection at Delhi. All India Institute of Medical Sciences (AIIMS) on Friday. According to initial reports, the Mumbai underworld gangster, who was undergoing treatment at the AIIMS after his condition deteriorated, died due to COVID-19 related complications in the afternoon. He was admitted to the hospital on April 24. Though DGP Tihar Jail said that no official information has come in this regard, other sources confirmed his death to Zee News."
  },
  {'id': 3, 'news': ''},
  {
    'id': 4,
    'news':
        "A new feature has been added to the CoWin portal after some users complained of their vaccination certificate being generated despite them not getting a jab. Now, anyone who has registered on the CoWin portal and selected a slot for vaccination will get a four-digit security code that they will have to produce at the vaccination centre to verify themselves."
  },
  {
    'id': 5,
    'news':
        "One of the world’s most highly regarded experts on global health has said the Modi government’s refusal to accept advice from its own scientists as well as its refusal to be guided by indisputable data is one of the main causes of the present COVID-19 crisis in India. Professor Ashish Jha has also said the Kumbh Mela shahi snans, held in March and April, when two and three million people gathered together without masks and social distancing, would be the biggest super-spreaders in this pandemic’s history. However, Jha also said he can see some signs of the present surge in COVID-19 cases plateauing but added the dark ominous cloud surrounding this silver lining is the fact they are plateauing at levels of 3.5 lakh cases a day, which is higher than any other country in the world.",
  },
  {'id': 6, 'news': ''},
];

class ViewNews extends StatefulWidget {
  final int id;
  final String title;
  const ViewNews({Key key, this.id, this.title}) : super(key: key);

  @override
  _ViewNewsState createState() => _ViewNewsState();
}

class _ViewNewsState extends State<ViewNews> {
  int x;

  @override
  void initState() {
    super.initState();
    x = news.indexWhere((news) => news['id'] == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.0),
              Text(
                news[x]['news'],
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
