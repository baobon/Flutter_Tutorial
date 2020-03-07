export 'weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/models/weather_model/weather.dart';

class WeatherAPIClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient;

  WeatherAPIClient(this.httpClient);

  // WeatherAPIClient(this.httpClient, {http.Client httpClient});

/*
  // Debug kiem tra null
  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);
*/

/* Method get Location API */
  Future<int> getLocationId(String city) async {
    // API search check in here https://www.metaweather.com/api/#locationsearch
    // https://www.metaweather.com/api/location/search/?query=
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    // wait get location
    final locationResponse = await this.httpClient.get(locationUrl);
    // check in here https://www.w3.org/Protocols/HTTP/HTRESP.html
    // check status code if success -> return code = 200
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    /// ????? ///
    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

/* Method get weather with location take above API */
  Future<Weather> fetchWeather(int locationId) async {
    /* API search check in here https://www.metaweather.com/api/#locationsearch
     https://www.metaweather.com/api/location/locationId
     Example : https://www.metaweather.com/api/location/44418/ => Get weather London
  */
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);
    // check in here https://www.w3.org/Protocols/HTTP/HTRESP.html
    // check status code if success -> return code = 200
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
  
    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
