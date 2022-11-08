import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class CityCard extends StatefulWidget {
  const CityCard({
    Key? key,
    required this.cityName,
    required this.backgroundImageName,
  }) : super(key: key);
  final String cityName;
  final String backgroundImageName;

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<WeatherProvider>(context, listen: false)
            .setWeatherDataByCityName(widget.cityName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${widget.backgroundImageName}'),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 50,
              right: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    widget.cityName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class City {
  final String cityName;
  final String backgroundImageName;

  City({
    required this.cityName,
    required this.backgroundImageName,
  });
}
