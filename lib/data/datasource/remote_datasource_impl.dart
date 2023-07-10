import 'dart:convert';

import 'package:weather_app/data/datasource/remote_datasource.dart';
import 'package:weather_app/domain/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource{

  final http.Client client;

  const WeatherRemoteDatasourceImpl(this.client);

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response = await client.get(Uri.parse(getUrlFromCityName(cityName)));
    if(response.statusCode == 200){
      return WeatherModel.fromJSON(json.decode(response.body));
    }else{
      throw Exception('Server failure');
    }
  }
  
}

 String getUrlFromCityName(String cityName) {
    return "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=d43894f3d1447287554f7dd5ceab9537&units=metric";
  }