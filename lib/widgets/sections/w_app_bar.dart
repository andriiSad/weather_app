import 'package:flutter/material.dart';

import '../../constants/my_constants.dart';
import '../../main.dart';

class WAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  WAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkModeOn(context) => Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(
        MyConstants.of(context)!.appName,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            onPressed: (() {
              if (darkModeOn(context)) {
                MyApp.of(context).changeTheme(ThemeMode.light);
              } else {
                MyApp.of(context).changeTheme(ThemeMode.dark);
              }
            }),
            icon: darkModeOn(context)
                ? const Icon(
                    Icons.sunny,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.sunny,
                    color: Colors.blueGrey,
                  ),
          ),
        ),
      ],
    );
  }
}
