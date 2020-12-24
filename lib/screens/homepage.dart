import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:apiapp/models/positionClass.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double longitude = 0.0;
  double latitude = 0.0;
  bool loading = true;


  void getuserLocation() async{

    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      _locationData = await location.getLocation();
      longitude = _locationData.longitude;
      latitude = _locationData.latitude;

      print(longitude);
      print(latitude);
      print("button pressed");

      Navigator.pushNamed(
        context, '/mainpage',
        arguments: positionClass(latitude: latitude, longitude : longitude)
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
       ),
       body: Container(
         child: Center(
           child: Card(
             child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text("Whats your location??"),
                  subtitle: Text("Click the button below")
                ),
                Row(
                  mainAxisAlignment : MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: getuserLocation,
                      child: Text(
                        "Get location"
                      )
                      ),
                      const SizedBox(width: 8),
                      FlatButton(
                        onPressed: null,
                        child: Text("Proceed")
                         )
                  ],
                )
              ], 
             )
           ),
         ),
       ),
      );
  }
}