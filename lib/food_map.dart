import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/pin_pill_info.dart';
import 'widgets/pin_pill_info.dart';

class FoodMap extends StatefulWidget {
  FoodMap({Key key}) : super(key: key);

  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {

  final CameraPosition vegasPosition = CameraPosition(target: LatLng(36.0953103, -115.1992098), zoom: 10);
  Set<Marker> allFoods= {};
  Completer<GoogleMapController> _controller = Completer();

  bool positionsCreated = false;
  bool markersCreated = false;
  BitmapDescriptor _grey;
  BitmapDescriptor _orange;
  BitmapDescriptor _red;
  BitmapDescriptor _green;


  double pinPillPosition = -100;
  PinInformation currentlySelectedPin = PinInformation(pinPath: '', avatarPath: '', labelColor: Colors.grey);
  PinInformation sourcePinInfo;
  PinInformation destinationPinInfo;

  @override
  void initState() {
    super.initState();
    initMarkers();
  } 
  void initMarkers()async{
    await createMarker();
    await createPositions();
    setState((){});
  }

  void createMarker() async{
    _grey = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/grey.png');
    _green = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/images/green.png');
    _orange = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/images/orange.png');
    _red = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/images/red.png');

  }

  void createPositions(){
    allFoods.add(Marker(
      markerId: MarkerId('first'),
      draggable: false,
      icon: _grey,
      onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
      },
      position: LatLng(36.0953103, -115.1992098),
    ));

    sourcePinInfo = PinInformation(
      pinPath: "assets/images/grey.png",
      avatarPath: "assets/images/grey.png",
      labelColor: Colors.blueAccent
    );

    allFoods.add(Marker(
      markerId: MarkerId('second'),
      draggable: false,
      icon: _green,
      onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },
      position: LatLng(31.0953103, -115.1992098),
    ));


    
    sourcePinInfo = PinInformation(
      pinPath: "assets/images/green.png",
      avatarPath: "assets/images/green.png",
      labelColor: Colors.blueAccent
    );


    allFoods.add(Marker(
      markerId: MarkerId('third'),
      draggable: false,
      icon: _orange,
      onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },
      position: LatLng(26.0953103, -15.1992098),
    ));

    
    sourcePinInfo = PinInformation(
      pinPath: "assets/images/red.png",
      avatarPath: "assets/images/green.png",
      labelColor: Colors.blueAccent
    );

    allFoods.add(Marker(
      markerId: MarkerId('fourth'),
      draggable: false,
      icon: _red,
      onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },
      position: LatLng(38.0953103, -115.1992098),
    ));

    
    sourcePinInfo = PinInformation(
      pinPath: "assets/images/red.png",
      avatarPath: "assets/images/green.png",
      labelColor: Colors.blueAccent
    );


    allFoods.add(Marker(
      markerId: MarkerId('fifth'),
      draggable: false,
      icon:_green,
      onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },
      position: LatLng(32.0953103, -115.1992098),
    ));
    
    sourcePinInfo = PinInformation(
      pinPath: "assets/images/red.png",
      avatarPath: "assets/images/green.png",
      labelColor: Colors.blueAccent
    );
  }
  void onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align( alignment: Alignment.centerRight, child: new Image.asset("assets/images/paws.png", width:30, height:30) )
      ),
      body:Stack(
          children: <Widget>[
            GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: vegasPosition,
                markers: allFoods,
                onMapCreated: onMapCreated,
            ),
            MapPinPillComponent(
                pinPillPosition: pinPillPosition,
                currentlySelectedPin: currentlySelectedPin
            )])
    );
  }
}
