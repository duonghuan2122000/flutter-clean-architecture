import 'dart:convert';

import 'package:clean_architecture_tdd/core/error/exceptions.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
abstract class NumberTriviaRemoteDataSource{
  /**
   * * Gọi đến http://numbersapi.com/{number}
   * * Throws một [ServerException] cho tất cả lỗi.
   */
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /**
   * * Gọi đến http://numbersapi.com/random
   * * Throws một [ServerException] cho tất cả lỗi.
   */
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource{
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async{
    // TODO: implement getConcreteNumberTrivia
    final response = await client.get(
      'http://numbersapi.com/$number',
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if(response.statusCode == 200){
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async{
    // TODO: implement getRandomNumberTrivia
    final response = await client.get(
      'http://numbersapi.com/random',
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if(response.statusCode == 200){
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}