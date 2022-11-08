import 'package:intl/intl.dart';

class Weather {
  final String cityName;
  final String countryCode;
  final int temp;
  final int tempMin;
  final int tempMax;
  final String mainWeather;
  final String description;
  final String iconId;
  final String date = DateFormat('d MMMM y').format(DateTime.now());

  Weather({
    required this.cityName,
    required this.countryCode,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.mainWeather,
    required this.description,
    required this.iconId,
  });
}
