import 'package:flutter/material.dart';
import 'Modal.dart';
import 'package:animai/map.dart';
class HelpBox extends StatefulWidget {
   HelpBox({
    Key key,
    this.status,
    this.message,
    this.distance,
  }) : super(key: key);


  final String message;
  int status;
  int distance;

  @override
  _HelpBox createState() => _HelpBox();
}

class _HelpBox extends State<HelpBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => showModal(),
    child: new Container(
          height:120.0,
          margin: new EdgeInsets.only(top:10.0, left:20.0, right:20.0),
          decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          child:  new Padding(
            padding: EdgeInsets.only(top:25.0, right:20.0, left:20.0, bottom:10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        flex:2,
                        child: new Align(
                          alignment: Alignment.topLeft, 
                          child: Text( 
                            widget.message,
                            style: new TextStyle( fontWeight: FontWeight.w500 , fontSize: 14.0)
                            )
                          )
                      ),
                      new Expanded(
                        flex:1,
                        child:new Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: new Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: (widget.status==1) ? Color.fromARGB(255, 235, 87, 87) : Color.fromARGB(255, 45, 156, 219),
                                      child:Icon(
                                        (widget.status==1) ? Icons.hourglass_top_outlined : Icons.car_repair,
                                        color: Colors.white,
                                        size: 18.0,
                                      ),
                                    ),
                                    Text(
                                      (widget.status==1) ? "Yardım Bekliyor" : "Barış D. yolda"
                                    ),
                                  ],
                                )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: new Align(
                                  alignment: Alignment.centerRight, 
                                  child: new Text( 
                                    (widget.distance.toString()) + " km. yakınında",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                      )
                                    )
                                  )
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
      ),
    );
  }
  void showModal() {
    showModalBottomSheet(context: context, builder: (context){
      return Modal(
        elements: Column(children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            child:Text(
              widget.message,
              style: new TextStyle(fontSize: 16),
            ),
          ),
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: (widget.status==1) ? Color.fromARGB(255, 235, 87, 87) : Color.fromARGB(255, 45, 156, 219),
                  child:Icon(
                    (widget.status==1) ? Icons.hourglass_top_outlined : Icons.car_repair,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:10),
                  child:Text(
                    (widget.status==1) ? "Yardım Bekliyor" : "Barış D. yolda"
                  )
                ),
              ],
            )
          ),
          Container(
            height:120,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
            child: EmergencyMap()
          )
        ]),
        color: Colors.red,
        icon: Icon(Icons.car_rental, color: Colors.white)
      );
    });
  }
}