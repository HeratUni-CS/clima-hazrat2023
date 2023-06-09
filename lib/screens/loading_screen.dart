import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData () async{
  var weatherData = await WeatherModel().getLocationWeather();

  Navigator.push(context, MaterialPageRoute(builder: (builder) {
    return LocationScreen(locatinWeather: weatherData,);
  }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(    //if didn't work type SpinKitDoubleBounce
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
