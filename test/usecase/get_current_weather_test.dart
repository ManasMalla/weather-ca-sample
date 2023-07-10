import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/entity/weather.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_current_weather.dart';

import 'get_current_weather_test.mocks.dart';

// @GenerateMocks([WeatherRepository])
void main(){
  late MockWeatherRepository weatherRepository;
  late GetCurrentWeather getCurrentWeather;

    setUp((){
      weatherRepository = MockWeatherRepository();
      getCurrentWeather = GetCurrentWeather(weatherRepository);
    });

  const String tCityName = 'Visakhapatnam';
  const Weather tWeather = Weather(main: "Sunny", temperature: 30.5);

  test('should fetch the weather data from repository', () async {
    when(weatherRepository.getCurrentWeather(tCityName)).thenAnswer((realInvocation) async => const Right(tWeather));
    final result = await getCurrentWeather.execute(tCityName);
    expect(result, const Right(tWeather));
  });

}