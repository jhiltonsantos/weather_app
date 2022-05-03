// https://www.weatherapi.com/
// http://api.weatherapi.com/v1/forecast.json?key=747bd273e82541cba6c181523222804&q=Teresina&days=10&aqi=no&alerts=no

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import 'interceptors/logging_interceptor.dart';

const String baseUrl = 'http://api.weatherapi.com/v1/';
const String apiKey = '747bd273e82541cba6c181523222804';
const String baseUrlWithApi = '${baseUrl}forecast.json?key=$apiKey';

const header = <String, String>{
  'Content-type': 'application/json',
};

final http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5));
