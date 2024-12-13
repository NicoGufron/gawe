import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';

  bool _disable = true;

  String get email => _email;
  String get password => _password;

  bool get disable => _disable; 

  set email(String email) {
    _email = email;
    checkSignInCredentials();
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    checkSignInCredentials();
    notifyListeners();
  }

  checkSignInCredentials() {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      _disable = false;
    } else {
      _disable = true;
    }
    notifyListeners();
  }
}

final signInProvider = ChangeNotifierProvider<SignInProvider>((ref) {return SignInProvider();});