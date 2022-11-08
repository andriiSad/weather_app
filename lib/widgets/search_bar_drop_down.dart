import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

// ignore: must_be_immutable
class SearchBarDropdown extends StatefulWidget {
  SearchBarDropdown({
    Key? key,
    required this.cityNames,
    required this.isExpanded,
    required this.isFound,
  }) : super(key: key);
  final List<String> cityNames;
  bool isExpanded = false;
  bool isFound = false;

  @override
  State<SearchBarDropdown> createState() => _SearchBarDropdownState();
}

class _SearchBarDropdownState extends State<SearchBarDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isExpanded)
              ...widget.cityNames.map(
                (cityName) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (widget.isFound) {
                          Provider.of<WeatherProvider>(context, listen: false)
                              .setWeatherDataByCityName(cityName);
                          setState(() {
                            widget.isExpanded = false;
                          });
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cityName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
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
