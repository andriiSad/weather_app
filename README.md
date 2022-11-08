### Weather App Project

A WeatherApp project created in Flutter for Steelkiwi Flutter Internship test task.

## Getting Started

The WeatherApp contains implementation of test task provided by Steelkiwi. This application allows you to view information about the weather in all cities, that are present in [OpenWeather API](https://openweathermap.org/api).

### How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/andriySad/weather_app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Run the project:

```
flutter run
```

### Folder Structure

Here is the core folder structure.

```
flutter-app/
|- android
|- build
|- ios
|- assets
|- lib
|- presentation
```

Here is the folder structure I have been using in this project

```
lib/
|- exceptions/
|- helpers/
|- models/
|- providers/
|- theme/
|- widgets/
|- main.dart
```

**Presentation**

In presentation folder you can find screenshots of working application, separated into two folders:

```
presentation/
|- light_mode/
|- dark_mode/
```

In each folder you can find screenshots related with corresponding theme mode.


## Now, lets dive into the lib folder which has the main code for the application.

**Providers**

 My app is using [Provider](https://github.com/rrousselGit/provider) package for state managing, data related to provider is placed in separated file '/lib/providers/weather_provider.dart'.
 
**Helpers**

All information related to API, such as requests sending, error handling, and generating Weather objects from json is placed in '/lib/helpers/api_helper'

**Models**

In '/lib/models' you can find information about models in weather app, such as:
  *'/lib/models/popular_city.dart' for popular city model
  *'/lib/models/weather.dart' for Weather model
  
**Widgets**

Contains widgets that are used in this app.

I splited this application into 3 main widgets located in sections folder, all smaller widgets are in widgets folder.

```
widgets/
|- sections
  |- w_app_bar.dart
  |- faq_widget.dart
  |- footer.dart
  |- popular_cities.dart
  |- weather_widget.dart
|- city_card.dart
|- search_bar_dropdown.dart
|- search_bar.dart
|- weather_card_loading.dart
|- weather_card.dart
```
 
 **Theame**

WeatherApp also has theaming, controlled by IconButton on a AppBar (because i didn't find information in test task, how should I controll theme), and all data related to theaming is placed in separated file '/lib/theme/theme.dart'.

**Assets**

In '/assets/images' placed all images related my app, such as:

  * '/assets/images/background' for background images
  * '/assets/images/popular_cities' for images in popular cities cards.
  
 **AppBar**

AppBar widget is located in '/lib/widgets/sections/w_app_bar.dart'

**Main**

This is the starting point of the application.


### Conclusion

It was a pleasure to complete this test task, I had the opportunity to remind myself a lot of things that I just forgot in the process of studying. I know this app is not perfect, but I continue to study  and improve my skills every day. Thank you for your time, and waiting for a feedback 😊


