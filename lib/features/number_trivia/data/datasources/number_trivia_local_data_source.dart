import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{
  /**
   * * lấy bộ nhớ đệm [NumberTriviaModel] đã được lưu ở lần cuối
   * * Người dùng đã kết nối Internet
   * * Throws [CacheException] nếu không có dữ liệu được trả về
   */
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}