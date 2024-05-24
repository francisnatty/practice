// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
class LoginHandle {
  final String token;
  const LoginHandle({
    required this.token,
  });
  const LoginHandle.fooBar() : token = 'foobar';
}
