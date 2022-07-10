import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  // Model for authentication entity
  const AuthModel({
    required name,
    required password,
  }) : super(
          name: name,
          password: password,
        );

  /// Convert the actual model data into a json map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
    };
  }
}
