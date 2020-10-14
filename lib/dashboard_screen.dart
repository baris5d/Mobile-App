import 'package:flutter/material.dart';

import 'widgets/help_box.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dirty Paws'),
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
    return Scaffold(
      appBar: AppBar(
        title: Align( alignment: Alignment.center, child: Text(widget.title) )
      ),
      body: HelpBox(
        message: "Küçük dostumuza araba çarpıp kaçmış birisi yardım etsin!",
        distance: 1,
        status: 0,
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.car_rental),
        backgroundColor: Color.fromARGB(255,235,87,87),
      ), 
    );
  }
}
