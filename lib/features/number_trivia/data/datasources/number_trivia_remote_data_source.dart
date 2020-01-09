import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';

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