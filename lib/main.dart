import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weather_provider.dart';
import 'theme/theme.dart';
import 'widgets/sections/footer.dart';
import 'widgets/sections/faq_widget.dart';
import 'widgets/sections/popular_cities_widget.dart';
import 'widgets/sections/w_app_bar.dart';
import 'widgets/sections/weather_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather App',
        theme: WAppTheme.lightTheme,
        darkTheme: WAppTheme.darkTheme,
        themeMode: _themeMode,
        home: const MyHomePage(title: 'Weather App'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(),
      body: ListView(
        children: <Widget>[
          const WeatherWidget(),
          const SizedBox(
            height: 50,
          ),
          PopularCititesWidget(),
          const SizedBox(
            height: 50,
          ),
          const FaqWidget(),
          const Footer(),
        ],
      ),
    );
  }
}
