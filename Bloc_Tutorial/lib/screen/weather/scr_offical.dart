/*
REST API
For this application we'll be hitting the metaweather API.

We'll be focusing on two endpoints:

/api/location/search/?query=$city to get a locationId for a given city name
/api/location/$locationId to get the weather for a given locationId

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/weatherapp/simple_bloc_delegate.dart';
import 'package:new_app/bloc/weatherapp/weather_bloc.dart';
import 'package:new_app/models/weather_model/models.dart';
import 'package:new_app/repositories/weather_repositori/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/screen/weather/scr_weather.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final WeatherRepository weatherRepository = WeatherRepository(
    WeatherAPIClient(
      http.Client(),
    ),
  );

  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository),
        child: Weathers(),
      ),
    );
  }
}
