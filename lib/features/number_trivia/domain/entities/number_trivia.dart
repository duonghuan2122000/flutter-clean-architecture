import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable{
  /**
 * * class NumberTrivia kế thừa từ class Equatable
 * @param text và number
 * TODO: số trivia
 */
  final String text;
  final int number;

  /**
   * * Hàm khởi tạo
   * TODO: gọi lớp cha Equatable super([...param]) để check 2 object bằng nhau (operator ==)
   */
  NumberTrivia({
    @required this.text,
    @required this.number
  }) : super([text, number]);
}