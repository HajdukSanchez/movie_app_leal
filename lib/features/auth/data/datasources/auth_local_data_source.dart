import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/features/auth/data/models/auth_model.dart';

abstract class AuthLocalDataSource {
  /// Log out user from the application.
  Future<bool> logOut();

  ///  Cache data of the logout user to the device.
  ///
  /// The Auth model is the model reporesenting the user data to be cached.
  Future<void> cacheAuthData(AuthModel auth);
}

const String authCachedKey = "AUTH_CACHED_KEY"; // TODO: Add to a enviroment file

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> logOut() {
    final authData = sharedPreferences.getString(authCachedKey);
    if (authData != null) {
      return Future.value(true);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAuthData(AuthModel auth) {
    return sharedPreferences.setString(authCachedKey, json.encode(auth.toJson()));
  }
}
