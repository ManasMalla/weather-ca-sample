import 'package:weather_app/domain/model/weather_model.dart';

abstract class WeatherRemoteDatasource{
  Future<WeatherModel> getCurrentWeather(String cityName);
}