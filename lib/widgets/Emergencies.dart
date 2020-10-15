import 'dart:convert';

import 'package:flutter/material.dart';
import 'help_box.dart';
import 'package:http/http.dart' as http;


class Emergencies extends StatefulWidget {
  Emergencies({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmergenciesState createState() => _EmergenciesState();
}

class _EmergenciesState extends State<Emergencies> {

  List data;

  @override
  void initState() {
    super.initState();
    getEmergency();
  }


  Future<String> getEmergency() async{
    final response =
      await http.get('https://api.mocki.io/v1/85f607d7');

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        print(result[0]);
        setState((){
          data = result;
        });
      } else {
        throw Exception('Failed to load album');
      }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
          itemCount: null==data ? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return HelpBox(
                message: data[index]['message'],
                distance: data[index]['distance'],
                status: data[index]['status'],
            );
          },
      ), 
    );
  }

}
