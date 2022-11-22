import 'package:flutter/material.dart';

import '../../constants/my_constants.dart';
import '../city_card.dart';

class PopularCititesWidget extends StatelessWidget {
  PopularCititesWidget({
    Key? key,
  }) : super(key: key);
  final List<City> popularCities = [
    City(cityName: 'New York', backgroundImageName: 'new_york.png'),
    City(cityName: 'London', backgroundImageName: 'london.png'),
    City(cityName: 'Dubai', backgroundImageName: 'dubai.png'),
    City(cityName: 'Paris', backgroundImageName: 'paris.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            MyConstants.of(context)!.popularCitiesSectionName,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        ...popularCities
            .map(
              (city) => CityCard(
                cityName: city.cityName,
                backgroundImageName: city.backgroundImageName,
              ),
            )
            .toList()
      ],
    );
  }
}
