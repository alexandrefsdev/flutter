import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  // Now i'm goin to create a variable that wil contais the location coordinates
  var locationMessage = '';

  // And now let's create a function that will get the current location
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Service'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.location_on,
              size: 46.0,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Get User Location',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(locationMessage),
          TextButton(
            onPressed: () => getCurrentLocation(),
            child: Text("Get Current Location"),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue[800],
              primary: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
