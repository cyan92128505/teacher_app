import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/foundation.dart';
import 'package:teacher/entities/entities.dart';
import 'package:teacher/models/models.dart';

class JWTUtils {
  static String key = 'Teacher APP';

  static Future<String> sign(User user, RoleType type) async {
    final payload = JWTPayload(
      id: '${user.id}',
      type: type.value,
    );
    final jwt = JWT(payload.toJson());
    return jwt.sign(SecretKey(key));
  }

  static Future<JWTPayload?> verify(String token) async {
    try {
      final jwt = JWT.verify(token, SecretKey(key));

      return JWTPayload.fromJson(jwt.payload);
    } on JWTExpiredException {
      debugPrint('jwt expired');
      return null;
    } on JWTException catch (ex) {
      debugPrint(ex.message);
      return null;
    }
  }
}
