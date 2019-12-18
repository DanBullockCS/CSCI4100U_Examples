import 'package:flutter/material.dart';

class BasicLayout extends StatefulWidget {
  BasicLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BasicLayoutState createState() => _BasicLayoutState();

}
class _BasicLayoutState extends State<BasicLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildStackWidget(),
      ),
    );
  }

  Widget _buildStackWidget() {
    return Stack(
      alignment: const Alignment(0, 0.5), // specify an arbritrary alignment
      children: <Widget>[
        CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.blue,
          child: Text("KD", textScaleFactor: 4.0),
        ),
        Container (
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
            child: Container (
            padding: EdgeInsets.all(5.0),
            child: Text("Kevin Desousa", textScaleFactor: 1.5,),
            ),
          ),
      ],
    );
  }

  Widget _buildColumnWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlutterLogo(
          size: 40.0,
          colors: Colors.amber,
        ),
        FlutterLogo(
          size: 40.0,
          colors: Colors.red,
        ),
        FlutterLogo(
          size: 40.0,
          colors: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildRowWidget() {
    return Container(
      height:  100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Row is horizontal axis
        crossAxisAlignment: CrossAxisAlignment.center, // Row is Vertically aligned
        children: <Widget>[
        Container(
          width: 50.0,
          color: Colors.red,
        ),
        Container(
          width: 50.0,
          color: Colors.green,
        ),
        Container(
          width: 50.0,
          color: Colors.blue,
        ),
        Container(
          width: 50.0,
          color: Colors.orange,
        ),
        ],
      ),
    );
  }
}