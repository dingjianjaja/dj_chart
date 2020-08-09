import 'package:flutter/material.dart';

typedef Widget DetailPageBuilder();

class DJShowDemoPage extends StatefulWidget {
  final Widget listTileIcon;
  final String title;
  final String subtitle;
  final DetailPageBuilder childBuilder;

  DJShowDemoPage(
      {this.listTileIcon, this.title, this.subtitle, this.childBuilder});

  Widget buildListTile(BuildContext context) {
    return ListTile(
      leading: listTileIcon,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => this));
      },
    );
  }

  @override
  _DJShowDemoPageState createState() => _DJShowDemoPageState();
}

class _DJShowDemoPageState extends State<DJShowDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250.0,
              child: widget.childBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
