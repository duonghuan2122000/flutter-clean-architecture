import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  /**
   * * Lớp trừu tượng Failure xử lý lỗi 
   * * Kế thừa class Equatable
   * * Hàm khởi tạo nhận vào một List collections (array)
   * @param properties(List)
   * * Gọi hàm khởi tạo lớp cha truyền tham số vào là một collections.
   */

  Failure([List propeties = const <dynamic>[]]) : super(propeties);
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
