import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/entity/weather.dart';
import 'package:weather_app/domain/model/weather_model.dart';

void main(){
  const tWeather = Weather(main: "Sunny", temperature: 25.94);
  const tWeatherModel = WeatherModel(main: "Sunny", temperature: 25.94);
  const tCityName = "Visakhapatnam";
  const tJSON = '{"coord":{"lon":83.2093,"lat":17.69},"weather":[{"id":701,"main":"Sunny","description":"mist","icon":"50n"}],"base":"stations","main":{"temp":25.94,"feels_like":26.91,"temp_min":25.94,"temp_max":25.94,"pressure":1004,"humidity":89},"visibility":4500,"wind":{"speed":1.54,"deg":270},"clouds":{"all":40},"dt":1689011282,"sys":{"type":1,"id":9255,"country":"IN","sunrise":1688947101,"sunset":1688994366},"timezone":19800,"id":1253102,"name":"Visakhapatnam","cod":200}';
  const tJSONData = {'main': "Sunny", "temp": 25.94};
group('to entity', () { 
  test('should return a valid entity from the model',  (){
    final result = tWeatherModel.toEntity();
    expect(result, equals(tWeather));
  });
});
group('from json', () {
  test('should provide a valid model from json', () { 
    final jsonData = json.decode(tJSON);
    final result = WeatherModel.fromJSON(jsonData);
    expect(result, tWeatherModel);
  });
 });
group('to json', () { 
  test('should return a valid json from model', () {
    final result = tWeatherModel.toJSON();
    expect(result, tJSONData);
  });
});

}