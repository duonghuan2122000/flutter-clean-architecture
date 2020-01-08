import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepository{
  /**
   * * Lớp trừu tượng NumberTriviaRepository
   * * Lớp gồm các phương thức trừu tượng thực hiện lấy thông tin số trivia có đầu số truyền vào hoặc ngẫu nhiên
   */

  /**
   * TODO: Phương thức lấy thông tin số trivia có đầu số truyền vào
   * @param int number
   */
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  /**
   * TODO: Phương thức lấy thông tin số trivia ngẫu nhiên
   */
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}