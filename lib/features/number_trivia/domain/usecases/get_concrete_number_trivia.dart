import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  /**
   * * Lớp GetConcreteNumberTrivia
   * * Lớp có một phương thức là repostiory kiểu là NumberTriviaRepository
   */
  final NumberTriviaRepository repository;

  /**
   * * Hàm khởi tạo phương thức
   * @param repository
   */
  GetConcreteNumberTrivia(this.repository);

  /**
   * * Phương thức call (thực thi) đồng bộ
   * TODO: lấy thông tin số trivia có tham số truyền vào
   */
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{
  final int number;

  Params({
    @required this.number
  }) : super([number]);
}
