import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTrivia {
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
   * * Phương thức execute (thực thi) đồng bộ
   * TODO: lấy thông tin số trivia có tham số truyền vào
   */
  Future<Either<Failure, NumberTrivia>> execute({@required int number}) async{
    return await repository.getConcreteNumberTrivia(number);
  }
}
