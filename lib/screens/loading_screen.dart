import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void fetchLoc() async {
    var data = await WeatherModel().getLocationWeather();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen(data)));
  }

  @override
  void initState() {
    fetchLoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
