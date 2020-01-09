import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  /**
   * Class GetRandomNumberTrivia
   * implements UseCase<Type, Params>
   * Lớp có một phương thức là một repository
   */
  final NumberTriviaRepository repository;

  /**
   * * Hàm khởi tạo
   */
  GetRandomNumberTrivia(this.repository);

  /**
   * * Hàm thực thi gọi ngẫu nhiên một số trivia không có tham số truyền vào
   * TODO: lấy thông tin của một số trivia ngẫu nhiên
   */
  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getRandomNumberTrivia();
  }
}