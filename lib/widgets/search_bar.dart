import 'package:flutter/material.dart';

import '../helpers/api_helper.dart';
import 'search_bar_drop_down.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<String> foundedCities = [];
  var _isFound = true;

  final _inputController = TextEditingController();

  void _sendCitiesRequest(String cityName) async {
    try {
      final result = await ApiHelper.getListOfCities(cityName);
      setState(() {
        foundedCities = result;
      });
    } catch (e) {
      setState(() {
        foundedCities = [e.toString()];
        _isFound = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(children: [
        Stack(
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                _sendCitiesRequest(_inputController.text);
              },
              controller: _inputController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'Start typing to search...',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: FloatingActionButton(
                mini: true,
                onPressed: (() {
                  _sendCitiesRequest(_inputController.text);
                }),
                child: const Icon(Icons.search),
              ),
            ),
          ],
        ),
        SearchBarDropdown(
          cityNames: foundedCities,
          isExpanded: true,
          isFound: _isFound,
        )
      ]),
    );
  }
}
