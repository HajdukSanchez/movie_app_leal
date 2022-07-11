import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/core/error/messages.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/log_out.dart';
import 'package:movies_app_leal/core/util/failure_to_message.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/login.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/blocs.dart';

class MockLogin extends Mock implements Login {}

class MockLogOut extends Mock implements LogOut {}

class MockMessage extends Mock implements Message {}

void main() {
  late MockLogin mockLogin;
  late MockLogOut mockLogOut;
  late MockMessage mockMessage;
  late AuthBloc bloc;

  setUp(() {
    mockLogin = MockLogin();
    mockLogOut = MockLogOut();
    mockMessage = MockMessage();
    bloc = AuthBloc(login: mockLogin, logout: mockLogOut, message: mockMessage);
  });

  test('Should initialState be AuthInitialState', () async {
    // assert
    expect(bloc.state, equals(AuthInitialState()));
  });

  group("AuthLoginEvent", () {
    setUp(() {
      when(() => mockLogin(const Params(testAuthUserModel)))
          .thenAnswer((_) async => const Right(testAuthUserModel));

      when(() => mockMessage.mapFailureToMessage(ServerFailure()))
          .thenReturn(invalidDataFailureMessage);
    });

    test('Should emit [Error] when login data is invalid', () async {
      // arrange
      when(() => mockLogin(const Params(testAuthUserModel)))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expectedList = [
        AuthLoadingState(),
        const AuthErrorState(message: invalidDataFailureMessage)
      ];
      expectLater(bloc.stream.asBroadcastStream(),
          emitsInOrder(expectedList)); // Expected stream order when we call the bloc event
      // act
      bloc.add(const AuthLoginEvent(auth: testAuthUserModel));
    });

    test('Should get data from the Login usecase', () async {
      // act
      bloc.add(const AuthLoginEvent(auth: testAuthUserModel));
      await untilCalled(() => mockLogin(const Params(testAuthUserModel)));
      // assert
      verify(() => mockLogin(const Params(testAuthUserModel)));
    });

    test('Should emit [loading, loaded] when data is gotten successfully', () async {
      // assert later
      final expectedList = [AuthLoadingState(), const AuthLoadedState(auth: testAuthUserModel)];
      expectLater(bloc.stream.asBroadcastStream(),
          emitsInOrder(expectedList)); // Expected stream order when we call the bloc event
      // act
      bloc.add(const AuthLoginEvent(auth: testAuthUserModel));
    });

    test('Should emit [loading, Error] when getting data fails', () async {
      // arrange
      when(() => mockLogin(const Params(testAuthUserModel)))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expectedList = [
        AuthLoadingState(),
        const AuthErrorState(message: invalidDataFailureMessage)
      ];
      expectLater(bloc.stream.asBroadcastStream(),
          emitsInOrder(expectedList)); // Expected stream order when we call the bloc event
      // act
      bloc.add(const AuthLoginEvent(auth: testAuthUserModel));
    });
  });

  group("AuthLogoutEvent", () {
    setUp(() {
      when(() => mockLogOut(NoParams())).thenAnswer((_) async => const Right(true));

      when(() => mockMessage.mapFailureToMessage(CacheFailure())).thenReturn(cachedFailureMessage);
    });

    test('Should emit [Error] when logout data is invalid', () async {
      // arrange
      when(() => mockLogOut(NoParams())).thenAnswer((_) async => Left(CacheFailure()));
      // assert later
      final expectedList = [
        AuthLoadingState(),
        const AuthErrorState(message: cachedFailureMessage)
      ];
      expectLater(bloc.stream.asBroadcastStream(),
          emitsInOrder(expectedList)); // Expected stream order when we call the bloc event
      // act
      bloc.add(AuthLogoutEvent());
    });

    test('Should get data from the logout usecase', () async {
      // act
      bloc.add(AuthLogoutEvent());
      await untilCalled(() => mockLogOut(NoParams()));
      // assert
      verify(() => mockLogOut(NoParams()));
    });

    test('Should emit [loading, loaded] when data is gotten successfully', () async {
      // assert later
      final expectedList = [AuthLoadingState(), AuthInitialState()];
      expectLater(bloc.stream.asBroadcastStream(),
          emitsInOrder(expectedList)); // Expected stream order when we call the bloc event
      // act
      bloc.add(AuthLogoutEvent());
    });

    test('Should emit [loading, Error] when getting data fails', () async {
      // arrange
      when(() => mockLogOut(NoParams())).thenAnswer((_) async => Left(CacheFailure()));
      // assert later
      final expectedList = [
        AuthLoadingState(),
        const AuthErrorState(message: cachedFailureMessage)
      ];
      expectLater(bloc.stream.asBroadcastStream(),
          emitsInOrder(expectedList)); // Expected stream order when we call the bloc event
      // act
      bloc.add(AuthLogoutEvent());
    });
  });
}
