import 'dart:convert';

import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';

class NumberTriviaWebService{

  late Dio dio;

  NumberTriviaWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://numbersapi.com/",
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
      headers: {'Content-Type': 'application/json'}
    );

    dio = Dio(options);
  }

  Future<NumberTriviaModel> getTriviaFromUrl(String endPoint) async {
    try {
      Response response = await dio.get(endPoint);
      if (response.statusCode == 200) {
        return NumberTriviaModel.fromJson(json.decode(response.data));
      } else {
        throw ServerException();
      }
    } catch (e) {
          print(e.toString());
          return NumberTriviaModel(text:"",number: 0);
    }
  }

  // Future<List<dynamic>> getAllCharacters() async {
  //   try {
  //     Response response = await dio.get('characters');
  //     print(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  //
  // }
  //
  // Future<List<dynamic>> getCharacterQuotes(String charName) async {
  //   try {
  //     Response response = await dio.get('quote' , queryParameters: {'author' : charName});
  //     print(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }

}