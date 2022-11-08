import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/weather.dart';
import '../../providers/weather_provider.dart';
import '../search_bar.dart';
import '../weather_card.dart';
import '../weather_card_loading.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    bool darkModeOn(context) => Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: darkModeOn(context)
              ? const AssetImage("assets/images/bg_night.png")
              : const AssetImage("assets/images/bg_day.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  FutureBuilder<Weather>(
                    future: Provider.of<WeatherProvider>(context).weatherData,
                    builder: (BuildContext context,
                        AsyncSnapshot<Weather> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const WeatherCardLoading();
                        default:
                          if (snapshot.hasError) {
                            return WeatherCardLoading(
                                errorMessage: snapshot.error.toString());
                          } else {
                            return WeatherCard(
                              weatherData: snapshot.data!,
                            );
                          }
                      }
                    },
                  ),
                ],
              ),
              const SearchBar(),
            ],
          ),
        ],
      ),
    );
  }
}
