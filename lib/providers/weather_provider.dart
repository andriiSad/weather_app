import 'package:flutter/material.dart';

import '../helpers/api_helper.dart';
import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Future<Weather>? _weatherData;

  Future<Weather> get weatherData {
    return _weatherData == null
        ? ApiHelper.getWeatherForSelectedCity('Odessa')
        : _weatherData!;
  }

  void setWeatherDataByCityName(String cityName) async {
    final result = ApiHelper.getWeatherForSelectedCity(cityName);
    _weatherData = result;
    notifyListeners();
  }
}
