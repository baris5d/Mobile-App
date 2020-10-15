import 'package:flutter/material.dart';
import 'widgets/Emergencies.dart';
import 'map.dart';

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
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align( alignment: Alignment.center, child: Text(widget.title) )
      ),
      body: Emergencies(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ Navigator.push(
          context,
              MaterialPageRoute(builder: (context) => Map())

        );
        },
        tooltip: 'Increment',
        child: Icon(Icons.car_rental),
        backgroundColor: Color.fromARGB(255,235,87,87),
      ), 
    );
  }

}
