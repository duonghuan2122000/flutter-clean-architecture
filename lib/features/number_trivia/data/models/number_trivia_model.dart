import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends NumberTrivia {
  /**
   * * Class NumberTriviaModel
   * * kế thừa NumberTrivia
   */

  /**
   * * Hàm khởi tạo
   * TODO: khởi tạo model
   * @param String text
   * @param int number
   */
  NumberTriviaModel({@required String text, @required int number})
      : super(text: text, number: number);

  /**
   * * Hàm fromJson
   * @param Map<String, dynamic> json là một kiểu map: string - values.
   * TODO: dùng để parse json thành các thuộc tính của model
   */
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json){
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt() 
    );
  }

  /**
   * * Hàm toJson
   * TODO: hàm chuyển dữ liệu model thành một json.
   */
  Map<String, dynamic> toJson(){
    return {
      "text": text,
      "number": number
    };
  }
}
