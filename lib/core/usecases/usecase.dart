import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  /**
   * Lớp trừu tượng UseCase<Type, Params>
   * @param Type: class, object hoặc model
   * @param Params: tham số truyền vào class thực thi
   */

  /**
   * Phương thức call
   * TODO: callback classes
   * @param Params: tham số truyền vào thực thi
   * * Kiểu trả về là một đồng bộ gồm error và data.
   */
  Future<Either<Failure, Type>> call(Params params);
}

/**
 * * Lớp NoParams kế thừa Equatable
 * TODO: Lớp dùng để làm tham số cho hàm lấy ngẫu nhiên số trivia
 */
class NoParams extends Equatable {}
