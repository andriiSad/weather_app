import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_app/exceptions/http_exception.dart';
import 'package:weather_app/models/weather.dart';
import '../exceptions/empty_input_exception.dart';

const apiKey = '429a47878356dcb48b0041b7cedfe6fa';

class ApiHelper {
  static Future<List<String>> getListOfCities(String cityName) async {
    List<String> resultList = [];
    final url =
        'https://api.openweathermap.org/data/2.5/find?q=$cityName&appid=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (json.decode(response.body)['list'] == null) {
      throw EmptyInputException();
    }
    if ((json.decode(response.body)['list'] as List).isEmpty) {
      throw HttpException();
    }
    json.decode(response.body)['list'].forEach((jsonElement) {
      resultList
          .add("${jsonElement['name']}, ${jsonElement['sys']['country']}");
    });

    return resultList;
  }

  static Future<Weather> getWeatherForSelectedCity(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    final response = await http.get(Uri.parse(url));
    final jsonInstance = json.decode(response.body);
    return Weather(
      cityName: jsonInstance['name'],
      countryCode: jsonInstance['sys']['country'],
      temp: (jsonInstance['main']['temp'] - 273.15).round(),
      tempMin: (jsonInstance['main']['temp_min'] - 273.15).round(),
      tempMax: (jsonInstance['main']['temp_max'] - 273.15).round(),
      mainWeather: jsonInstance['weather'][0]['main'],
      description: jsonInstance['weather'][0]['description'],
      iconId: jsonInstance['weather'][0]['icon'],
    );
  }
}
