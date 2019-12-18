import 'package:flutter/material.dart';

class lab3 extends StatefulWidget {
  lab3({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TweetWidget createState() => TweetWidget(
  "Dan", "DanKB", "5h", 
  "So basically this is a tweet",
  "https://picsum.photos/id/911/500/250", 25, 1204, 2354);
}

class TweetWidget extends State<lab3> {
  String userShortName;
  String userLongName;
  String timeString;
  String description;
  String imageURL;
  int numComments;
  int numRetweets;
  int numLikes;

  TweetWidget(userShortName, userLongName, timeString, 
  description, imageURL, numComments, numRetweets, numLikes) {
    this.userShortName = userShortName;
    this.userLongName = userLongName;
    this.timeString = timeString;
    this.description = description;
    this.imageURL = imageURL;
    this.numComments = numComments;
    this.numRetweets = numRetweets;
    this.numLikes = numLikes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () { print('This would be the top tweets button'); }
          ),
        ],
      ),

      body: buildListView(),
    );
  }

}

  Widget _buildTweetWidget(userShortName, userLongName, timeString, 
  description, imageURL, numComments, numRetweets, numLikes, avatarColor) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
            Container (
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 25.0,
                backgroundColor: avatarColor,
                child: Text(userShortName[0]+userShortName[1], textScaleFactor: 1.5),
              ),
            ),
            ]
          ),
          Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
             Row (
              children: [
                Text (
                  userShortName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
                ),
                Padding(padding: const EdgeInsets.only(right: 16.0)),
                Text (
                  '@' + userLongName,
                ),
                Padding(padding: const EdgeInsets.only(right: 16.0)),
                Text (
                    timeString,
                ),
                Padding(padding: const EdgeInsets.only(right: 16.0)),
                Icon (
                  Icons.expand_more,
                ),
              ]
             ),
              Row ( 
                children: [
                Text (
                    description, textAlign: TextAlign.left,
                ),
                ]
              ),
              Row (
                children: <Widget> [
                  Container (
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Image.network(imageURL),
                  ), 
                ]
              ),
             Row (
              children: [
              Icon (
                Icons.chat_bubble_outline,
              ),
              Text (
                  numComments.toString(),
              ),
              Padding(padding: const EdgeInsets.only(right: 32.0)),
              Icon (
                Icons.repeat,
              ),
              Text (
                  numRetweets.toString(),
              ),
              Padding(padding: const EdgeInsets.only(right: 32.0)),
              Icon (
                Icons.favorite_border,
              ),
              Text (
                  numLikes.toString(),
              ),
              Padding(padding: const EdgeInsets.only(right: 32.0)),
              Icon (
                Icons.share,
              ),
             ],
             ),
            ]
          ),
        ]
    );
  }

  Widget buildListView() {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        _buildTweetWidget('Fortnite', 'FortniteGame', '2h', 
         'Hey guys we out here with Fortnites ',
          'https://picsum.photos/id/910/325/250', 24,
         543, 1, Colors.blue),
         Padding(padding: const EdgeInsets.all(16.0)),
        _buildTweetWidget('NASA', 'NASA', '10y', 
        'Selling Pluto for 10 dollars!',
        'https://picsum.photos/id/911/325/250', 4324,
        753, 1000, Colors.yellow),
      ],
    );
  }