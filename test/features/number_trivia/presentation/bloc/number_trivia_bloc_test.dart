// import 'package:clean_architecture_tdd/core/error/failures.dart';
// import 'package:clean_architecture_tdd/core/usecases/usecase.dart';
// import 'package:clean_architecture_tdd/core/util/input_converter.dart';
// import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
// import 'package:clean_architecture_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
// import 'package:clean_architecture_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
// import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockGetConcreteNumberTrivia extends Mock
//     implements GetConcreteNumberTrivia {}

// class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

// class MockInputConverter extends Mock implements InputConverter {}

// void main() {
//   NumberTriviaBloc bloc;
//   MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
//   MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
//   MockInputConverter mockInputConverter;

//   setUp(() {
//     mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
//     mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
//     mockInputConverter = MockInputConverter();

//     bloc = NumberTriviaBloc(
//         concrete: mockGetConcreteNumberTrivia,
//         random: mockGetRandomNumberTrivia,
//         inputConverter: mockInputConverter);
//   });

//   test('initialState should be Empty', () {
//     //assert
//     expect(bloc.initialState, equals(Empty()));
//   });

//   group('GetTriviaForConcreteNumber', () {
//     final tNumberString = '1';
//     final tNumberParsed = 1;
//     final tNumberTrivia = NumberTrivia(number: 1, text: 'test string');

//     void setUpMockInputConverterSuccess() => 
//       when(mockInputConverter.stringToUnsignedInteger(any))
//           .thenReturn(Right(tNumberParsed));

//     test(
//         'should call the InputConverter to validate the converter the string to an unsigned integer',
//         () async {
//       //arrange
//       setUpMockInputConverterSuccess();
//       //act
//       bloc.dispatch(GetTriviaForConcreteNumber(numberString: tNumberString));
//       await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
//       //assert
//       verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
//     });

//     test('should emit [Error] when the input is invalid', () async{
//       //arrange
//       when(mockInputConverter.stringToUnsignedInteger(any))
//           .thenReturn(Left(InvalidInputFailure()));
//       //assert later
//       final expected = [Empty(), Error(message: INVALID_INPUT_FAILURE_MESSAGE)];
//       expectLater(bloc.state, emitsInOrder(expected));
//       //act
//       bloc.dispatch(GetTriviaForConcreteNumber(numberString: tNumberString));
//     });

//     test(
//       'should get data from the concrete use case',
//       () async{
//         setUpMockInputConverterSuccess();
//         when(mockGetConcreteNumberTrivia(any))
//           .thenAnswer((_) async => Right(tNumberTrivia));
//         //act
//         bloc.dispatch(GetTriviaForConcreteNumber(numberString: tNumberString));
//         await untilCalled(mockGetConcreteNumberTrivia(any));
//         //assert
//         verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
//       }
//     );

//     test(
//       'should emit [Loading, Loaded] when data is gotten successfully',
//       () async{
//         //arrange
//         setUpMockInputConverterSuccess();
//         when(mockGetConcreteNumberTrivia(any))
//           .thenAnswer((_) async => Right(tNumberTrivia));
//         //assert later
//         final expected = [
//           Empty(),
//           Loading(),
//           Loaded(trivia: tNumberTrivia)
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         //act
//         bloc.dispatch(GetTriviaForConcreteNumber(numberString: tNumberString));
//       }
//     );

//     test(
//       'should emit [Loading, Error] when data is gotten failure',
//       () async{
//         //arrange
//         setUpMockInputConverterSuccess();
//         when(mockGetConcreteNumberTrivia(any))
//           .thenAnswer((_) async => Left(ServerFailure()));
//         //assert later
//         final expected = [
//           Empty(),
//           Loading(),
//           Error(message: SERVER_FAILURE_MESSAGE)
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         //act
//         bloc.dispatch(GetTriviaForConcreteNumber(numberString: tNumberString));
//       }
//     );

//     test(
//       'should emit [Loading, Error] with a proper message for the error when getting data error',
//       () async{
//         //arrange
//         setUpMockInputConverterSuccess();
//         when(mockGetConcreteNumberTrivia(any))
//           .thenAnswer((_) async => Left(CacheFailure()));
//         //assert later
//         final expected = [
//           Empty(),
//           Loading(),
//           Error(message: CACHE_FAILURE_MESSAGE)
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         //act
//         bloc.dispatch(GetTriviaForConcreteNumber(numberString: tNumberString));
//       }
//     );

//   });

//   group('GetTriviaForRandomNumber', () {
//     final tNumberTrivia = NumberTrivia(number: 1, text: 'test string');

//     test(
//       'should get data from the random use case',
//       () async{
//         //arrange
//         when(mockGetRandomNumberTrivia(any))
//           .thenAnswer((_) async => Right(tNumberTrivia));
//         //act
//         bloc.dispatch(GetTriviaForRandomNumber());
//         await untilCalled(mockGetRandomNumberTrivia(any));
//         //assert
//         verify(mockGetRandomNumberTrivia(NoParams()));
//       }
//     );

//     test(
//       'should emit [Loading, Loaded] when data is gotten successfully',
//       () async{
//         //arrange
//         when(mockGetRandomNumberTrivia(any))
//           .thenAnswer((_) async => Right(tNumberTrivia));
//         //assert later
//         final expected = [
//           Empty(),
//           Loading(),
//           Loaded(trivia: tNumberTrivia)
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         //act
//         bloc.dispatch(GetTriviaForRandomNumber());
//       }
//     );

//     test(
//       'should emit [Loading, Error] when data is gotten failure',
//       () async{
//         //arrange
//         when(mockGetRandomNumberTrivia(any))
//           .thenAnswer((_) async => Left(ServerFailure()));
//         //assert later
//         final expected = [
//           Empty(),
//           Loading(),
//           Error(message: SERVER_FAILURE_MESSAGE)
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         //act
//         bloc.dispatch(GetTriviaForRandomNumber());
//       }
//     );

//     test(
//       'should emit [Loading, Error] with a proper message for the error when getting data error',
//       () async{
//         //arrange
//         when(mockGetRandomNumberTrivia(any))
//           .thenAnswer((_) async => Left(CacheFailure()));
//         //assert later
//         final expected = [
//           Empty(),
//           Loading(),
//           Error(message: CACHE_FAILURE_MESSAGE)
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         //act
//         bloc.dispatch(GetTriviaForRandomNumber());
//       }
//     );

//   });

// }
