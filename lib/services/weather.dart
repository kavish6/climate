import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': city,
      'appid': '2a792d42729948b2926ee4d04068153a',
      'units': 'metric'
    });
    Network network = Network(uri);
    var data = await network.getLocationData();
    print('completed getting data');
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    print('getlocationfunc called');
    Location location = Location();
    await location.getCurrentLocation();
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': '2a792d42729948b2926ee4d04068153a',
      'units': 'metric'
    });
    Network network = Network(uri);
    var data = await network.getLocationData();
    print('completed getting data');
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp, String city) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time in $city';
    } else if (temp > 20) {
      return 'Time for shorts and ๐ in $city';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค in $city';
    } else {
      return 'Bring a ๐งฅ just in case in $city';
    }
  }
}
