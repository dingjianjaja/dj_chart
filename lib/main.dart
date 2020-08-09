import 'package:dj_chart/demo_detail_page.dart';
import 'package:dj_chart/show_demo_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Charts Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    List itemDetails =  [DJShowDemoPage(
      listTileIcon: Icon(Icons.show_chart),
      title: 'flutter_chart 线图Demo',
      subtitle: "subtitle",
      childBuilder: () => DJDemoDetailPage.showWithSampleData(),
    )];

    List<Widget> items = [];
    items.addAll(itemDetails.map((e) => e.buildListTile(context)));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: items,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
