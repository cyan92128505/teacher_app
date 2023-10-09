import 'dart:convert';

import 'package:conduit_password_hash/conduit_password_hash.dart';

String generatePassword(String password) {
  var generator = PBKDF2();
  var salt = generateAsBase64String(256);
  var hash = generator.generateKey(password, salt, 1000, 32);
  return base64Encode(hash);
}
