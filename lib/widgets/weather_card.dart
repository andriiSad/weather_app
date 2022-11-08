import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.weatherData,
  }) : super(key: key);
  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Card(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.network(
                        'https://openweathermap.org/img/wn/${weatherData.iconId}.png',
                        scale: 0.7,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      weatherData.temp < 0
                          ? '${weatherData.temp} \u2103'
                          : '+${weatherData.temp} \u2103',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      weatherData.mainWeather,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      weatherData.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${weatherData.cityName}, ${weatherData.countryCode}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    weatherData.date,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Divider(
                thickness: 0.5,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('Min'),
                        Text(
                          weatherData.tempMin < 0
                              ? '${weatherData.tempMin} \u2103'
                              : '+${weatherData.tempMin} \u2103',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.blue,
                      thickness: 0.5,
                    ),
                    Column(
                      children: [
                        const Text('Max'),
                        Text(
                          weatherData.tempMin < 0
                              ? '${weatherData.tempMax} \u2103'
                              : '+${weatherData.tempMax} \u2103',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
