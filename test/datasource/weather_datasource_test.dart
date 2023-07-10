import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/datasource/remote_datasource.dart';
import 'package:weather_app/data/datasource/remote_datasource_impl.dart';
import 'package:weather_app/domain/model/weather_model.dart';

import 'weather_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){
  late WeatherRemoteDatasource datasource;
  late MockClient client;

  setUp((){
    client = MockClient();
    datasource = WeatherRemoteDatasourceImpl(client);
  });

  group('get current weather', () {
    const String tCityName = 'Visakhapatnam';
    const WeatherModel tWeatherModel = WeatherModel(main: "Sunny", temperature: 25.94);
    const tJSON = '{"coord":{"lon":83.2093,"lat":17.69},"weather":[{"id":701,"main":"Sunny","description":"mist","icon":"50n"}],"base":"stations","main":{"temp":25.94,"feels_like":26.91,"temp_min":25.94,"temp_max":25.94,"pressure":1004,"humidity":89},"visibility":4500,"wind":{"speed":1.54,"deg":270},"clouds":{"all":40},"dt":1689011282,"sys":{"type":1,"id":9255,"country":"IN","sunrise":1688947101,"sunset":1688994366},"timezone":19800,"id":1253102,"name":"Visakhapatnam","cod":200}';
  
    test('return a valid weather model when status code is 200', () async {
      when(client.get(Uri.parse(getUrlFromCityName(tCityName)))).thenAnswer((realInvocation) async => http.Response(tJSON,200));
      final result = await datasource.getCurrentWeather(tCityName);
      expect(result, tWeatherModel);
    });
    
    test('throw a server error when status code is not 200', () async {
      when(client.get(Uri.parse(getUrlFromCityName(tCityName)))).thenAnswer((realInvocation) async => http.Response('Not found', 404));
      final call = datasource.getCurrentWeather(tCityName);
      expect(()=>call, throwsA(isA<Exception>()));
    });
   });
}