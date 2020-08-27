import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Lat;
  var Long;
  Position currentLocation;
  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      Lat = currentLocation.latitude;
      Long = currentLocation.longitude;
    });
    print(Lat);
    print(Long);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  HomePage(
                  lat: Lat,
                  long: Long,
                ),
      ),
    );
  }
}
